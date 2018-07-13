class ReporteNumeroIntentosLectorController < ApplicationController

	def index
		user = current_usuario
    @zonas = user.empleado.zona
    @tipo_lectura = TipoLectura.all
	end

	# => Carga Porciones
	respond_to :js, :html, :json
	def carga_porciones
		@porciones = Porcion.where(zona_id: params[:zona])
		respond_with @porciones
	end

	# => Carga Comunas
	respond_to :js, :html, :json
	def carga_comunas
		@comunas = Comuna.where(zona_id: params[:zona])
		respond_with @comunas
	end

	# => Carga Empleados
	respond_to :js, :html, :json
	def carga_empleados  #Busca los empleados  por zona y perfil 6, 7
		porcion = Porcion.where(id: params[:porcion]).take
		if !porcion.nil?
			@empleados = porcion.zona.empleado.joins(:usuario).where(usuarios: {perfil_id: [6,7]})
		end
    respond_with @empleados
	end

	respond_to :js, :html, :json
	def carga_filtro
		#Busca asignaciones de empleado para porcion, proceso y comuna seleccionados
		ordenes = OrdenLectura.where(estado_lectura_id: [2..5], tipo_lectura_id: params[:tipo_lectura]).joins(:asignacion, :rutum).
																where(asignacions: {empleado_id: params[:empleado]},
																ruta:{porcion_id: params[:porcion]})
		@header_hash = Hash.new()
		intentos_hash = Hash.new()
		ordenes.each do |orden|
			num_intentos = orden.detalle_orden_lectura.take.intento.count
			key = orden.rutum.codigo_nombre + "_" + num_intentos.to_s
			if intentos_hash[key].nil?
				intentos_hash[key] = 1
			else
				intentos_hash[key] = intentos_hash[key] + 1
			end
			@header_hash[num_intentos] = num_intentos
		end
		@header_hash = @header_hash.values.sort
		asignaciones = Asignacion.where(empleado_id: params[:empleado]).joins(:porcion, :orden_lectura).where(porcions: { zona_id: params[:zona],
													id: params[:porcion] },orden_lecturas:{estado_lectura_id: [2,3,4,5],tipo_lectura_id: params[:tipo_lectura]}).group(:rutum_id)

		@lista = Array.new
		asignaciones.each do |asignacion|
			row = Array.new
			row.push(asignacion.orden_lectura.rutum.porcion.codigo_nombre)
			row.push(asignacion.orden_lectura.comuna.nombre)
			row.push(asignacion.orden_lectura.asignacion.empleado.nombre_completo)
			row.push(asignacion.orden_lectura.rutum.codigo_nombre)
			#Total asignado al lector de esta ruta
			row.push(Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).
								joins(:orden_lectura).where(orden_lecturas: {tipo_lectura_id: params[:tipo_lectura], estado_lectura_id: [2..5],relectura:false}).count)
			#recorrer hash
			key = asignacion.orden_lectura.rutum.codigo_nombre + "_"
			intentos = Array.new
			@header_hash.each do |header|
				if intentos_hash[key + header.to_s].nil?
					intentos.push(0)
				else
					intentos.push(intentos_hash[key + header.to_s])
				end
			end
			p intentos
			row.push(intentos)
			@lista.push(row)
		end
		@lista = @lista.paginate(:page => params[:page], :per_page => 5)
		respond_with @lista
	end


	################# Exportar  ###################

	#Exportar Excel
	def exportar_excel
		#Busca asignaciones de empleado para porcion, proceso y comuna seleccionados
		ordenes = OrdenLectura.where(estado_lectura_id: [2..5],relectura:false).joins(:asignacion, :rutum).
																where(asignacions: {empleado_id: params[:empleado]},
																ruta:{porcion_id: params[:porcion]})

		@header_hash = Hash.new()
		intentos_hash = Hash.new()
		ordenes.each do |orden|
			num_intentos = orden.detalle_orden_lectura.take.intento.count
			key = orden.rutum.codigo_nombre + "_" + num_intentos.to_s
			if intentos_hash[key].nil?
				intentos_hash[key] = 1
			else
				intentos_hash[key] = intentos_hash[key] + 1
			end
			@header_hash[num_intentos] = num_intentos
		end
		@header_hash = @header_hash.values.sort
		asignaciones = Asignacion.where(empleado_id: params[:empleado]).joins(:porcion, :orden_lectura).where(porcions: { zona_id: params[:zona],
													id: params[:porcion] },orden_lecturas:{estado_lectura_id: [2,3,4,5],
													tipo_lectura_id: params[:tipo_lectura]}).group(:rutum_id)

		body = String.new
		asignaciones.each do |asignacion|
			body << asignacion.orden_lectura.rutum.porcion.codigo_nombre + ","
			body << asignacion.orden_lectura.comuna.nombre + ","
			body << asignacion.orden_lectura.asignacion.empleado.nombre_completo + ","
			body << asignacion.orden_lectura.rutum.codigo_nombre + ","
			#Total asignado al lector de esta ruta
			body << Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).
								joins(:orden_lectura).where(orden_lecturas: {tipo_lectura_id: params[:tipo_lectura]}).count.to_s
			#recorrer hash
			key = asignacion.orden_lectura.rutum.codigo_nombre + "_"
			@header_hash.each do |header|
				body << ","
				if intentos_hash[key + header.to_s].nil?
					body << "0"
				else
					body << intentos_hash[key + header.to_s].to_s
				end
			end
			body << "\n"
		end

		header = "Porcion, Comuna, Lector, Ruta, Asignado"
		@header_hash.each do |head|
			if head == 0
				header << "Pendientes"
			else
				header << ", Cant. Intentos con " + head.to_s
			end
		end
		header << "\n"
		fecha = Time.now.strftime('%I%M%S%p%d%m%Y')
		file = "reporte_cantidad_de_intentos - " +  fecha.to_s + ".csv"

		File.open(file, "w+:UTF-16LE:UTF-8") do |csv|
			csv << header
			csv << body
		end
		send_file(file, x_sendfile: true, buffer_size: 512)
	end

	#Exportar PDF
	def exportar_pdf
		#Busca asignaciones de empleado para porcion, proceso y comuna seleccionados
		ordenes = OrdenLectura.where(estado_lectura_id: [2..5]).joins(:asignacion, :rutum).
																where(asignacions: {empleado_id: params[:empleado]},
																ruta:{porcion_id: params[:porcion]})

		@header_hash = Hash.new()
		intentos_hash = Hash.new()
		ordenes.each do |orden|
			num_intentos = orden.detalle_orden_lectura.take.intento.count
			key = orden.rutum.codigo_nombre + "_" + num_intentos.to_s
			if intentos_hash[key].nil?
				intentos_hash[key] = 1
			else
				intentos_hash[key] = intentos_hash[key] + 1
			end
			@header_hash[num_intentos] = num_intentos
		end
		@header_hash = @header_hash.values.sort
		asignaciones = Asignacion.where(empleado_id: params[:empleado]).joins(:porcion, :orden_lectura).where(porcions: { zona_id: params[:zona],
													id: params[:porcion] },orden_lecturas:{estado_lectura_id: [2,3,4,5],
													tipo_lectura_id: params[:tipo_lectura]}).group(:rutum_id)

		@lista = Array.new
		asignaciones.each do |asignacion|
			row = Array.new
			row.push(asignacion.orden_lectura.rutum.porcion.codigo_nombre)
			row.push(asignacion.orden_lectura.comuna.nombre)
			row.push(asignacion.orden_lectura.asignacion.empleado.nombre_completo)
			row.push(asignacion.orden_lectura.rutum.codigo_nombre)
			#Total asignado al lector de esta ruta
			row.push(Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).
								joins(:orden_lectura).where(orden_lecturas: {tipo_lectura_id: params[:tipo_lectura]}).count)
			#recorrer hash
			key = asignacion.orden_lectura.rutum.codigo_nombre + "_"
			@header_hash.each do |value|
				if intentos_hash[key + value.to_s].nil?
					row.push(0)
				else
					row.push(intentos_hash[key + value.to_s])
				end
			end
			@lista.push(row)
		end
		#Se arma el header del pdf
		header = ["Porcion", "Comuna", "Lector", "Ruta", "Asignado"]
		@header_hash.each do |value|
			if value == 0
				header.push("Pendientes")
			else
				header.push("Cant. Intentos con " + value.to_s)
			end
		end

		fecha = Time.now.to_s
		nombre = "reporte_cantidad_de_intentos - " + fecha + ".pdf"
		pdf = Prawn::Document.new

		pdf.text "Reporte Cantidad de Intentos" , size: 20 , style: :bold
		pdf.move_down 20
		data = [header]
		data += @lista
		pdf.table data,
			:header => true,
			:cell_style => { size: 10 },
			:row_colors => ["FFFFFF", "FFFFFF"] do
				row(0).font_style = :bold
			end
			pdf.move_down 20
		send_data pdf.render, filename: nombre, type: 'application/pdf'
	end
end
