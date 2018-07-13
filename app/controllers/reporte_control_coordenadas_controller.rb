class ReporteControlCoordenadasController < ApplicationController

	# => Control de Coordenadas GPS
	def index
		# Busca usuario y zonas y porcion del usuario logueado
		user = current_usuario
    	@zonas = user.empleado.zona
	end

	################# Selects  ###################

	# => Carga Empleados
	respond_to :js, :html, :json
	def carga_empleados
		#Busca los empleados  por zona y perfil 6, 7
    @empleados = Array.new
    zona = Zona.where(id: params[:zona]).first
  	if !zona.nil?
      listaEmp = zona.empleado
      listaEmp.each do |empleado|
      	if empleado.usuario.perfil_id == 6 || empleado.usuario.perfil_id ==7
          @empleados.push(empleado)
        end
      end
    end
    respond_with @empleados
	end

	# => Carga Rutas
	respond_to :js, :html, :json
	def carga_rutas
		@rutas = Rutum.where(porcion_id: params[:porcion], abierto: true)
		respond_with @rutas
	end

	# => Carga Porciones
	respond_to :js, :html, :json
	def carga_porciones
		@porciones = Porcion.where(zona_id: params[:zona], abierto: true)
		respond_with @porciones
	end

	################# Filtros  ###################

	# => Carga Filtro del Reporte Siete
	respond_to :js, :html, :json
	def carga_filtro
		georeferencia = params[:georeferencia].to_i
		p georeferencia
		if (georeferencia == 0) then
			#Lista de asignaciones
			@listaRsiete = Asignacion.where(
				empleado_id: params[:empleado] ).joins(:porcion, :orden_lectura).where(
				porcions: { zona_id: params[:zona], id: params[:porcion] },orden_lecturas:{estado_lectura_id: [4,5]} 
			)
		end
		if (georeferencia == 1) then
			@listaRsiete = Asignacion.where(
				porcion_id: params[:porcion]).joins(:porcion, :orden_lectura).where(
				porcions: { zona_id: params[:zona], id: params[:porcion] },
				orden_lecturas:{estado_lectura_id: [4,5], gps_latitud: nil, gps_longitud: nil} 
			)
			p @listaRsiete
		end
		@listaRsiete = @listaRsiete.paginate(:page => params[:page], :per_page => 5)
		respond_with @listaRsiete

	end

	#Carga ubicacion de una instalacion
	respond_to :js, :html, :json
	def carga_ubicacion
	    @ubicaciones = Array.new
	    latitud = params[:latitud]
	    longitud = params[:longitud]
	    @ubicaciones.push([latitud.to_s, longitud.to_s, ""])
	    @hash = Gmaps4rails.build_markers(@ubicaciones) do |u, marker|
	    	marker.lat u[0]
	    	marker.lng u[1]
	    	marker.infowindow u[2]
	    end
	    respond_with @hash
	end

	# Exportar Csv
	def exportar_excel
		georeferencia = params[:georeferencia].to_i
		if (georeferencia == 0) then
			#Lista de asignaciones
			@listaRsiete = Asignacion.where(empleado_id: params[:empleado] ).joins(:porcion, :orden_lectura).where(porcions: { zona_id: params[:zona], id: params[:porcion] },
                                     orden_lecturas:{estado_lectura_id: [4,5]} )
		end
		if (georeferencia == 1) then
			@listaRsiete = Asignacion.where(porcion_id: params[:porcion]).joins(:porcion, :orden_lectura).where(porcions: { zona_id: params[:zona], id: params[:porcion] },
                                     orden_lecturas:{estado_lectura_id: [4,5], gps_latitud: nil, gps_longitud: nil} )
		end
		header = "Zona, Comuna, Lector, Ruta,Instalacion, Fecha Lectura, Hora Lectura, Latitud, Longitud\n"
    	fecha = Time.now
    	file = "control_gps - " +  fecha.to_s + ".csv"

    	File.open(file, "w+:UTF-16LE:UTF-8") do |csv|
     		csv << header
      		@listaRsiete.each do |l|
        		csv << l.porcion.zona.nombre + "," + l.orden_lectura.comuna.nombre + "," + l.empleado.nombre + "," + l.rutum.codigo_nombre + "," +
        		 l.orden_lectura.instalacion.codigo + "," + l.orden_lectura.detalle_orden_lectura.first.fecha_ejecucion.strftime("%e/%m/%Y ") + "," +
        		 l.orden_lectura.detalle_orden_lectura.first.fecha_ejecucion.strftime("%H:%M:%S")+ "," +
        		 l.orden_lectura.gps_latitud.to_s+ "," +
        		 l.orden_lectura.gps_longitud.to_s+ "\n"
      		end
    	end
    	send_file(file, x_sendfile: true, buffer_size: 512)
	end

	# => Exportar PDF
	respond_to :js, :html, :json, :pdf
	def exportar_pdf
		georeferencia = params[:georeferencia].to_i
		if (georeferencia == 0) then
			#Lista de asignaciones
			@listaRsiete = Asignacion.where(empleado_id: params[:empleado] ).joins(:porcion, :orden_lectura).where(porcions: { zona_id: params[:zona], id: params[:porcion] },
                                     orden_lecturas:{estado_lectura_id: [4,5]} )
		end
		if (georeferencia == 1) then
			@listaRsiete = Asignacion.where(porcion_id: params[:porcion]).joins(:porcion, :orden_lectura).where(porcions: { zona_id: params[:zona], id: params[:porcion] },
                                     orden_lecturas:{estado_lectura_id: [4,5], gps_latitud: nil, gps_longitud: nil} )
		end
		p @listaRsiete

		fecha = Time.now.strftime("%d%m%Y%H%M%S").to_s 
		nombre = "reporte_control_coordenadas - " + fecha + ".pdf"
		pdf = Prawn::Document.new(:page_layout => :landscape)
			pdf.font "Helvetica"
			pdf.image "#{Rails.root}/public/images/interfase_fastbilling.png",:position => :right,  :width => 120
			pdf.move_down 2
			pdf.text "CONTROL DE COORDENADAS GPS", size: 18 , style: :bold, :align => :center
			pdf.move_down 20
			data = [["Zona", "Comuna", "Lector", "Ruta", "Nº Instalación", "Nº Cliente", "Cliente","Fecha Lectura","Hora Visitada","Latitud", "Longitud"]]			
			lista = Array.new
			@listaRsiete.each do |l|
				lista.push([l.porcion.zona.nombre,l.orden_lectura.comuna.nombre,l.empleado.nombre,l.rutum.codigo_nombre,
				l.orden_lectura.instalacion.codigo, l.orden_lectura.cliente.numero_cliente, l.orden_lectura.cliente.nombre,
				l.orden_lectura.detalle_orden_lectura.first.fecha_ejecucion.strftime("%e/%m/%Y "),l.orden_lectura.detalle_orden_lectura.first.fecha_ejecucion.strftime("%H:%M:%S"),
				l.orden_lectura.gps_latitud,l.orden_lectura.gps_longitud])
			end
			data += lista
			contador = data.length
			pdf.table data,:header => true, :column_widths => [50,55,60,80,80,55,120,55,55,55,55],
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
