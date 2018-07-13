class HistoricoLecturasController < ApplicationController
	respond_to :html, :js, :json

  def index
	end

	def exportar_pdf
		numeroCliente = ""
		nombreArchivo = ""
		fechaDescarga = ""
		lista = Array.new
		seleccion = params[:seleccion].to_i

		if seleccion == 1 #Busca Por Cliente
			@lecturas = OrdenLectura.where(estado_lectura_id: [4..5], relectura:false).joins(:cliente).where(clientes:{numero_cliente: params[:busqueda].to_i})
	 	elsif seleccion == 2 #Busca por Numero Medidor
			@lecturas = OrdenLectura.where(estado_lectura_id: [4..5], relectura:false).joins(:medidor).where(medidors:{numero_medidor: params[:busqueda].to_i})
	 	else seleccion == 3 #Busca por Numero instalación
			@lecturas = OrdenLectura.where(estado_lectura_id: [4..5], relectura:false).joins(:instalacion).where(instalacions:{codigo: params[:busqueda].to_i})
		end

		if !@lecturas.nil?
			@lecturas.each do |l| #Recorro O.L y Creo Lista con Valores a mostrar en tabla
				fila = Array.new
				numeroCliente = l.cliente.numero_cliente.to_s
				fila.push(l.asignacion.empleado.nombre_completo)
				fila.push(l.medidor.numero_medidor)
				fila.push(l.instalacion.codigo)
				fila.push(l.direccion)
				fila.push(l.comuna.nombre)
				fila.push(l.tipo_lectura.nombre)
				fila.push(l.detalle_orden_lectura.take.fecha_ejecucion.strftime('%d/%m/%Y'))
				fila.push(l.detalle_orden_lectura.take.fecha_ejecucion.strftime('%I:%M:%S %p'))
				fila.push(l.detalle_orden_lectura.take.lectura_actual)
				fila.push(l.detalle_orden_lectura.take.clave_lectura.codigo)
				lista.push(fila)
			end 
			fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
			nombreArchivo = "historicoLecturas_"+numeroCliente+"_" +fechaDescarga+ ".pdf"
			 pdf = Prawn::Document.new(:page_layout => :landscape)
				pdf.font "Helvetica"
				pdf.image "#{Rails.root}/public/images/interfase_fastbilling.png",:position => :right,  :width => 120
				pdf.move_down 2
				pdf.move_down 20
				pdf.text "Historico Lecturas: ", size: 18 , style: :bold
				pdf.move_down 2
				pdf.stroke_horizontal_rule
				pdf.move_down 15
				pdf.text "Cliente: " + @lecturas.first.cliente.nombre, size: 10
				pdf.move_down 3
				pdf.text "Nº Cliente: " + @lecturas.first.cliente.numero_cliente.to_s, size: 10
				pdf.move_down 3
				pdf.stroke_horizontal_rule
				pdf.move_down 10
				data = [["Lector", "Medidor", "Instalacion", "Dirección", "Comuna", "Proceso","Fecha","Hora", "Lectura", "Clave Lectura"]]	
				data += lista
				contador = data.length
				pdf.table data,
					:header => true,
					:column_widths => [110,55,70,150,70,60,55,55,50,45],
					:cell_style => { size: 8 },
					:row_colors => ["FFFFFF", "dddddd"] do
					row(0).borders = [:top, :bottom, :left, :right]
					row(0..contador).border_width = 0.5
					row(0).font_style = :bold
					row(0..contador).align = :center
					row(0).background_color = 'F0F0F1'
					row(0).size = 9
				end
				pdf.move_down 20
			send_data pdf.render, filename: nombreArchivo, type: 'application/pdf'
		end
	end

	def exportar_csv
		lista = Array.new
		seleccion = params[:seleccion].to_i

		if seleccion == 1 #Busca Por Cliente
			lecturas = OrdenLectura.where(estado_lectura_id: [4..5], relectura:false).joins(:cliente).where(clientes:{numero_cliente: params[:busqueda].to_i})
	 	elsif seleccion == 2 #Busca por Numero Medidor
			lecturas = OrdenLectura.where(estado_lectura_id: [4..5], relectura:false).joins(:medidor).where(medidors:{numero_medidor: params[:busqueda].to_i})
	 	else seleccion == 3 #Busca por Numero instalación
			lecturas = OrdenLectura.where(estado_lectura_id: [4..5], relectura:false).joins(:instalacion).where(instalacions:{codigo: params[:busqueda].to_i})
		end

		if !lecturas.nil? 
			numeroCliente = lecturas.take.cliente.numero_cliente.to_s
			fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
			nombreArchivo = "historicoLecturas_"+numeroCliente+"_" +fechaDescarga+ ".csv"
			cabecera = "Lector, Medidor, Intalación, Dirección, Comuna, Proceso, Fecha, Hora, Lectura, Clave Lectura, \n"
			File.open(nombreArchivo, "w+:UTF-16LE:UTF-8") do |csv|
				csv << cabecera
			 lecturas.each do |l|
				 csv << l.asignacion.empleado.nombre_completo + "," + 
								l.medidor.numero_medidor.to_s + "," + 
								l.instalacion.codigo.to_s + "," + 
								l.direccion + "," + 
								l.comuna.nombre + "," + 
								l.tipo_lectura.nombre + "," + 
								l.detalle_orden_lectura.take.fecha_ejecucion.strftime('%d/%m/%Y').to_s + "," + 
								l.detalle_orden_lectura.take.fecha_ejecucion.strftime('%I:%M:%S %p').to_s + "," + 
								l.detalle_orden_lectura.take.lectura_actual.to_s+ "," +
								l.detalle_orden_lectura.take.clave_lectura.codigo + "\n"
			 end
		 end
		 send_file(nombreArchivo, x_sendfile: true, buffer_size: 512)
		end
	end

	def carga_filtro
		seleccion = params[:seleccion].to_i
   	if seleccion == 1 #Busca Por Cliente
			@lecturas = OrdenLectura.where(estado_lectura_id: [4..5], relectura:false).joins(:cliente).where(clientes:{numero_cliente: params[:busqueda].to_i})
		elsif seleccion == 2 #Busca por Numero Medidor
			@lecturas = OrdenLectura.where(estado_lectura_id: [4..5], relectura:false).joins(:medidor).where(medidors:{numero_medidor: params[:busqueda].to_i})
		else seleccion == 3 #Busca por Numero instalación
			@lecturas = OrdenLectura.where(estado_lectura_id: [4..5], relectura:false).joins(:instalacion).where(instalacions:{codigo: params[:busqueda].to_i})
		end
		respond_with @lecturas
	end	
	

  def carga_ubicacion # Muestra Ubicacion de Lectura
    ubicaciones = Array.new
		lectura = OrdenLectura.where(id: params[:orden_id]).first
		p lectura
    if (!lectura.gps_latitud.nil? && !lectura.gps_longitud.nil?) && (lectura.gps_latitud.to_i != 0  && lectura.gps_longitud.to_i != 0)
    	detalle = lectura.detalle_orden_lectura.take#DetalleOrdenLectura.where(orden_lectura_id: a.id).first
      ventana = "N Cliente: " + lectura.cliente.numero_cliente.to_s + "\n" + detalle.fecha_ejecucion.strftime('%e/%m/%Y %I:%M:%S %p')
      ubicaciones.push([lectura.gps_latitud, lectura.gps_longitud, ventana])
    end
    @hash = Gmaps4rails.build_markers(ubicaciones) do |u, marker|
      marker.lat u[0]
      marker.lng u[1]
      marker.infowindow u[2]
		end
		respond_with @hash
  end

	def carga_fotografia # Muestra la Fotografia de una lectura
		detalle = DetalleOrdenLectura.where(orden_lectura_id: params[:id_orden]).first
		@lista_fotos = Fotografium.where(detalle_orden_lectura_id: detalle.id)
		respond_with @lista_fotos
	end
	
end
