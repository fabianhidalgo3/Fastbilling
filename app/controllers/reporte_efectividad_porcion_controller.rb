class ReporteEfectividadPorcionController < ApplicationController
	
	def index # > Pagina Principal
		user = current_usuario	# > Busca usuario y zonas y porcion del usuario logueado
    @zonas = user.empleado.zona
    @tipo_lectura = TipoLectura.all
		@claves = ClaveLectura.all
		@totales = Array.new
	end

	respond_to :js, :html, :json
	def carga_porciones 	# => Carga Porciones		
		zona = params[:zona].to_i
		desde_mes = params[:desde].split("/")[1]
		desde_ano = params[:desde].split("/")[2]
		hasta_mes = params[:hasta].split("/")[1]
		hasta_ano = params[:hasta].split("/")[2]
		@porciones = Porcion.where(zona_id: zona, mes: [desde_mes..hasta_mes], ano: [desde_ano..hasta_ano])
		respond_with @porciones
	end

	respond_to :js, :html, :json
	def carga_filtro 	# => Filtro del Reporte		
		@lista = Array.new
		@totales = Array.new
		t_asignado = 0
		t_claveEfectivo = 0
		t_claveImprocedente = 0
		t_problemasTecnicos = 0
		asignado = 0
		claveEfectivo = 0
		claveImprocedente = 0
		problemasTecnicos = 0
		total = 0
		t_efectividad =0
		contador = 0
		listaEmpleados = Empleado.joins(:usuario).where(usuarios: {perfil_id: [6,7]})		
	 	listaEmpleados.each do |empleado|
			listaAsignaciones = Asignacion.where(empleado_id: empleado.id).joins(:porcion,
				:orden_lectura).where(porcions:{ zona_id: params[:zona].to_i, id: params[:porcion].to_i },
				orden_lecturas:{estado_lectura_id: [2,3,4,5]}).group(:rutum_id)
		
		 if !listaAsignaciones.blank?
			 listaAsignaciones.each do |asignacion|
				 ruta = asignacion.rutum
				 comuna = asignacion.orden_lectura.comuna.nombre
				 asignado = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura).where(orden_lecturas:{relectura:false}).count
				 claveEfectivo = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5], relectura:false}, clave_lecturas: {efectivo: true}).count
				 claveImprocedente = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5], relectura:false}, clave_lecturas: {id: [12,13,14,15,18]}).count
				 problemasTecnicos = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5], relectura:false}, clave_lecturas: {id: [16,17]}).count
				 @lista.push([ruta.porcion.codigo_nombre, comuna, empleado.nombre_completo, 
				 							ruta.codigo, asignado, claveEfectivo, claveImprocedente, problemasTecnicos, 
											(claveEfectivo + claveImprocedente + problemasTecnicos),((claveEfectivo*100.0)/asignado).round(2)])
			 end
			 	contador = contador +1
				t_asignado +=  asignado	
				t_claveEfectivo = t_claveEfectivo + claveEfectivo
				t_claveImprocedente = t_claveImprocedente + claveImprocedente
				t_problemasTecnicos = t_problemasTecnicos + problemasTecnicos	
				total = total + (claveEfectivo + claveImprocedente + problemasTecnicos)
				t_efectividad = ((t_efectividad + (claveEfectivo*100.0)/asignado)/contador).round(2)
		 end 
	 end
	 @totales.push(t_asignado, t_claveEfectivo, t_claveImprocedente, t_problemasTecnicos, total, t_efectividad)
	 # > Ordena Lista por Nombre Ruta
	 @lista.sort! {|a,b| a[3] <=> b[3]}
	 respond_with @lista
	end

	def exportar_excel # > Exportar Documento CSV
		@lista = Array.new
		@totales = Array.new
		t_asignado = 0
		t_claveEfectivo = 0
		t_claveImprocedente = 0
		t_problemasTecnicos = 0
		asignado = 0
		claveEfectivo = 0
		claveImprocedente = 0
		problemasTecnicos = 0
		total = 0
		t_efectividad =0
		contador = 0
		listaEmpleados = Empleado.joins(:usuario).where(usuarios: {perfil_id: [6,7]})		
	 	listaEmpleados.each do |empleado|
			listaAsignaciones = Asignacion.where(empleado_id: empleado.id).joins(:porcion,
				:orden_lectura).where(porcions:{ zona_id: params[:zona].to_i, id: params[:porcion].to_i },
				orden_lecturas:{estado_lectura_id: [2,3,4,5]}).group(:rutum_id)
			
			if !listaAsignaciones.blank?
				listaAsignaciones.each do |asignacion|
					ruta = asignacion.rutum
				 	comuna = asignacion.orden_lectura.comuna.nombre
				  asignado = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).count
				  claveEfectivo = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5]}, clave_lecturas: {efectivo: true}).count
				  claveImprocedente = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5]}, clave_lecturas: {id: [12,13,14,15,18]}).count
				  problemasTecnicos = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5]}, clave_lecturas: {id: [16,17]}).count
				  @lista.push([ruta.porcion.codigo_nombre, comuna, empleado.nombre_completo, 
				 							ruta.codigo, asignado, claveEfectivo, claveImprocedente, problemasTecnicos, 
											(claveEfectivo + claveImprocedente + problemasTecnicos),((claveEfectivo*100.0)/asignado).round(2)])
			  end
			 	contador += contador
				t_asignado = t_asignado + asignado	
				t_claveEfectivo = t_claveEfectivo + claveEfectivo
				t_claveImprocedente = t_claveImprocedente + claveImprocedente
				t_problemasTecnicos = t_problemasTecnicos + problemasTecnicos	
				total = total + (claveEfectivo + claveImprocedente + problemasTecnicos)
				if t_efectividad > 0
					t_efectividad = (t_efectividad + (claveEfectivo*100.0)/asignado).round(2)/contador
				end
		  end 
	 	end
	 	@totales.push(t_asignado, t_claveEfectivo, t_claveImprocedente, t_problemasTecnicos, total, t_efectividad)
		# > Ordena Lista por Nombre Ruta
	 	@lista.sort! {|a,b| a[3] <=> b[3]}
    header = "Porción, Comuna, Lector, Ruta,Asignado,Claves Efectivas,Claves Improcedentes,Problemas Tecnicos,Total, % Efectividad\n"
		fecha = Time.now.strftime("%d%m%Y%H%M%S").to_s
		file = "reporte_efectividad_porcion - " +  fecha.to_s + ".csv"
		File.open(file, "w+:UTF-16LE:UTF-8") do |csv|
			csv << header
			@lista.each do |l|
				csv << l[0].to_s + "," + l[1].to_s + "," + l[2].to_s + "," + 
							 l[3].to_s + "," + l[4].to_s + "," + l[5].to_s + "," + 
							 l[6].to_s + "," + l[7].to_s + "," + l[8].to_s + "," + 
							 l[9].to_s + "," + "\n"
			end
			csv << "" + "," + "" + "," + "" + "," + "" + "," +
						 @totales[0].to_s + "," + @totales[1].to_s + "," +
						 @totales[2].to_s + "," + @totales[3].to_s + "," +
						 @totales[4].to_s + "," + @totales[5].to_s + "," + "\n"

		end
		send_file(file, x_sendfile: true, buffer_size: 512)
	end

	def exportar_pdf # > Exporta Documento PDF
		@lista = Array.new
		@totales = Array.new
		t_asignado = 0
		t_claveEfectivo = 0
		t_claveImprocedente = 0
		t_problemasTecnicos = 0
		asignado = 0
		claveEfectivo = 0
		claveImprocedente = 0
		problemasTecnicos = 0
		total = 0
		t_efectividad =0
		contador = 0
		listaEmpleados = Empleado.joins(:usuario).where(usuarios: {perfil_id: [6,7]})		
	 	listaEmpleados.each do |empleado|
			listaAsignaciones = Asignacion.where(empleado_id: empleado.id).joins(:porcion,
				:orden_lectura).where(porcions:{ zona_id: params[:zona].to_i, id: params[:porcion].to_i },
				orden_lecturas:{estado_lectura_id: [2,3,4,5]}).group(:rutum_id)
			
			if !listaAsignaciones.blank?
				listaAsignaciones.each do |asignacion|
					ruta = asignacion.rutum
				 	comuna = asignacion.orden_lectura.comuna.nombre
				  asignado = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).count
				  claveEfectivo = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5]}, clave_lecturas: {efectivo: true}).count
				  claveImprocedente = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5]}, clave_lecturas: {id: [12,13,14,15,18]}).count
				  problemasTecnicos = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5]}, clave_lecturas: {id: [16,17]}).count
				  @lista.push([ruta.porcion.codigo_nombre, comuna, empleado.nombre_completo, 
				 							ruta.codigo, asignado, claveEfectivo, claveImprocedente, problemasTecnicos, 
											(claveEfectivo + claveImprocedente + problemasTecnicos),((claveEfectivo*100.0)/asignado).round(2)])
			  end
			 	contador += contador
				t_asignado = t_asignado + asignado	
				t_claveEfectivo = t_claveEfectivo + claveEfectivo
				t_claveImprocedente = t_claveImprocedente + claveImprocedente
				t_problemasTecnicos = t_problemasTecnicos + problemasTecnicos	
				total = total + (claveEfectivo + claveImprocedente + problemasTecnicos)
				if t_efectividad > 0
					t_efectividad = (t_efectividad + (claveEfectivo*100.0)/asignado).round(2)/contador
				end
		  end 
	 	end
		@totales.push(t_asignado, t_claveEfectivo, t_claveImprocedente, t_problemasTecnicos, total, t_efectividad)
		fecha = Time.now.strftime("%d%m%Y%H%M%S").to_s 
		nombre = "reporte_efectividad_porcion - " + fecha + ".pdf"
		pdf = Prawn::Document.new(:page_layout => :landscape)
			pdf.font "Helvetica"
			pdf.image "#{Rails.root}/public/images/interfase_fastbilling.png",:position => :right,  :width => 120
			pdf.move_down 2
			pdf.text "EFECTIVIDAD POR PORCIÓN", size: 18 , style: :bold, :align => :center
			pdf.move_down 20
			data = [["Porcion", "Comuna", "Lector", "Ruta", "Asignado", "Claves Efectivas", "Claves Improcedentes","Problemas Tecnicos","Total","% Efectividad"]]			
			data += @lista
			data +=[[{:content => "Totales",:colspan =>4,:size => 14},@totales[0],@totales[1],@totales[2],@totales[3],@totales[4],@totales[5]]]
			contador = data.length
			pdf.table data,:header => true, :column_widths => [120,65,90,80,56,55,54,55,55,52],
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
