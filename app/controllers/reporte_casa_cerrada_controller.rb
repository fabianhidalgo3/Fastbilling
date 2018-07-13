class ReporteCasaCerradaController < ApplicationController
	def index
		user = current_usuario	# > Busca usuario y zonas y porcion del usuario logueado
		@zonas = user.empleado.zona
		@totales = Array.new		
	end	

	respond_to :js, :html, :json	
	def carga_porciones # => Carga Porciones
		zona = params[:zona].to_i		
		@porciones = Porcion.where(zona_id: zona)
		respond_with @porciones
	end

	respond_to :js, :html, :json
	def carga_lectores 	# => Carga Lectores	
		zona = params[:zona].to_i
		@lectores = Empleado.joins(:usuario, :zona).where(usuarios:{perfil_id: [6,7]}, zonas:{id: zona})
		respond_with @lectores
	end

	respond_to :js, :html, :json	
	def carga_filtro
		if params[:lector] != ""
			ordenes = OrdenLectura.where(
				estado_lectura_id: [4,5]).joins(:rutum, :asignacion).where(
				ruta: {porcion_id: params[:porcion]}, asignacions: {empleado_id: params[:lector]
			})
		else
			ordenes = OrdenLectura.where(
				estado_lectura_id: [4,5]).joins(:rutum).where(
				ruta: {porcion_id: params[:porcion]} 
			)
		end
		@lista = Array.new
		ordenes.each do |orden|
			if  orden.detalle_orden_lectura.first.observacione_id == 25
				row = Array.new
				row.push(orden.rutum.porcion.codigo_nombre)
				row.push(orden.comuna.nombre)
				row.push(orden.asignacion.empleado.nombre_completo)
				row.push(orden.rutum.codigo_nombre)
				row.push(orden.cliente.nombre)	
				row.push(orden.instalacion.codigo)	
				row.push(orden.cliente.numero_cliente)	
				row.push(orden.detalle_orden_lectura.take.fecha_ejecucion.strftime('%d/%m/%Y'))#fecha
				row.push(orden.detalle_orden_lectura.take.fecha_ejecucion.strftime('%I:%M:%S %p'))#hora				
				row.push(orden.detalle_orden_lectura.take.clave_lectura.nombre)
				row.push(orden.folio_casa_cerrada)
				row.push(orden.direccion)
				row.push(orden.detalle_orden_lectura.take.observacione.codigo)
				@lista.push(row)
			end
		end
		#@lista = @lista.paginate(:page => params[:page], :per_page => 5)
		respond_with @lista
	end

	def exportar_excel
		if params[:lector] != ""
			ordenes = OrdenLectura.where(
				estado_lectura_id: [4,5]).joins(:rutum, :asignacion).where(
				ruta: {porcion_id: params[:porcion]}, asignacions: {empleado_id: params[:lector]
			})
		else
			ordenes = OrdenLectura.where(
				estado_lectura_id: [4,5]).joins(:rutum).where(
				ruta: {porcion_id: params[:porcion]} 
			)
		end
		@lista = Array.new
		ordenes.each do |orden|
			if  orden.detalle_orden_lectura.take.clave_lectura_id == 16
				row = Array.new
				row.push(orden.rutum.porcion.codigo_nombre)
				row.push(orden.comuna.nombre)
				row.push(orden.asignacion.empleado.nombre_completo)
				row.push(orden.rutum.codigo_nombre)
				row.push(orden.cliente.nombre)	
				row.push(orden.instalacion.codigo)	
				row.push(orden.cliente.numero_cliente)	
				row.push(orden.detalle_orden_lectura.take.fecha_ejecucion.strftime('%d/%m/%Y'))#fecha
				row.push(orden.detalle_orden_lectura.take.fecha_ejecucion.strftime('%I:%M:%S %p'))#hora				
				row.push(orden.detalle_orden_lectura.take.clave_lectura.nombre)
				row.push(orden.folio_casa_cerrada)
				
				@lista.push(row)
			end
		end
		#@lista = @lista.paginate(:page => params[:page], :per_page => 5)
		header = "Porción, Comuna, Lector, Ruta, Cliente,Nº Instalación, Nº Cliente, Fecha Lectura,Hora Visitada, Clave Lectura, Nº Folio\n"
		fecha = Time.now.strftime("%d%m%Y%H%M%S").to_s
		file = "reporte_casa_cerrada - " +  fecha.to_s + ".csv"
		File.open(file, "w+:UTF-16LE:UTF-8") do |csv|
			csv << header
			@lista.each do |l|
				csv << l[0].to_s + "," + l[1].to_s + "," + l[2].to_s + "," + 
							 l[3].to_s + "," + l[4].to_s + "," + l[5].to_s + "," + 
							 l[6].to_s + "," + l[7].to_s + "," + l[8].to_s + "," + 
							 l[9].to_s + "," + l[10].to_s + "," + "\n"
			end
		end
		send_file(file, x_sendfile: true, buffer_size: 512)
	end

	def exportar_pdf
		if params[:lector] != ""
			ordenes = OrdenLectura.where(
				estado_lectura_id: [4,5]).joins(:rutum, :asignacion).where(
				ruta: {porcion_id: params[:porcion]}, asignacions: {empleado_id: params[:lector]
			})
		else
			ordenes = OrdenLectura.where(
				estado_lectura_id: [4,5]).joins(:rutum).where(
				ruta: {porcion_id: params[:porcion]} 
			)
		end
		@lista = Array.new
		ordenes.each do |orden|
			if  orden.detalle_orden_lectura.take.clave_lectura_id == 16
				row = Array.new
				row.push(orden.rutum.porcion.codigo_nombre)
				row.push(orden.comuna.nombre)
				row.push(orden.asignacion.empleado.nombre_completo)
				row.push(orden.rutum.codigo_nombre)
				row.push(orden.cliente.nombre)	
				row.push(orden.instalacion.codigo)	
				row.push(orden.cliente.numero_cliente)	
				row.push(orden.detalle_orden_lectura.take.fecha_ejecucion.strftime('%d/%m/%Y'))#fecha
				row.push(orden.detalle_orden_lectura.take.fecha_ejecucion.strftime('%I:%M:%S %p'))#hora				
				row.push(orden.detalle_orden_lectura.take.clave_lectura.nombre)
				row.push(orden.folio_casa_cerrada)
				
				@lista.push(row)
			end
		end
		fecha = Time.now.strftime("%d%m%Y%H%M%S").to_s 
		nombre = "reporte_casa_cerrada - " + fecha + ".pdf"
		pdf = Prawn::Document.new(:page_layout => :landscape)
			pdf.font "Helvetica"
			pdf.image "#{Rails.root}/public/images/interfase_fastbilling.png",:position => :right,  :width => 120
			pdf.move_down 2
			pdf.text "CASAS CERRADAS", size: 18 , style: :bold, :align => :center
			pdf.move_down 20
			data = [["Porcion", "Comuna", "Lector", "Ruta", "Cliente", "Nº Instalación", "Nº Cliente", "Fecha Lectura","Hora Visitada","Clave Lectura", "Nª Folio"]]			
			data += @lista
			contador = data.length
			pdf.table data,:header => true, :column_widths => [70,65,60,80,120,55,54,55,55,52],
										 :cell_style => { size: 10 },:row_colors => ["FFFFFF", "FFFFFF"] do
				row(0).align = :center
				style row(0), :size => 8
				style row(1..contador), :size => 8
				row(0).font_style = :bold
				row(1..contador).align = :center
				row(0).borders = [:top, :bottom, :left, :right]
				row(0).background_color = 'CFD8DC'
			end
			pdf.move_down 20
		send_data pdf.render, filename: nombre, type: 'application/pdf'
	end
end
