class ImpresionRuterosController < ApplicationController
	respond_to :js, :html, :json, :pdf

	def index 	# => Muestra Pagina Principal..		
		user = current_usuario # Usuario Loggeado
    @zonas = user.empleado.zona # Zonas de un Empledo
		@tipo_lectura = TipoLectura.all 
	end

	# => Carga Porciones..
	def carga_porciones
		@porciones = Porcion.where(zona_id: params[:zona])
		respond_with @porciones
	end

	# => Carga Rutas..
	def carga_rutas
		@rutas = Rutum.where(porcion_id: params[:porcion])
	end

	#arreglo
	# => Carga Filtro..
	def carga_filtro
		@lista_ordenes = OrdenLectura.where(rutum_id: params[:ruta], tipo_lectura_id: params[:proceso]).paginate(:page => params[:page], :per_page => 10)
		rutaNombre = @lista_ordenes.first.rutum.codigo
		fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
		respond_to do |format|
			format.js
		end
	end

	def exportar_pdf
			@lista_ordenes = OrdenLectura.where(rutum_id: params[:ruta], tipo_lectura_id: params[:proceso]).order(:posicion)
			rutaNombre = @lista_ordenes.first.rutum.codigo
			fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
			if !@lista_ordenes.nil?
				respond_to do |format|
					format.pdf do
						pdf = render_to_string :template => "impresion_ruteros/reporte", :layout => "pdf.html", :pdf => "layout/reporte", :encoding => "UTF-8"
						send_data(pdf, :filename => 'ruta_'+rutaNombre +'_'+ fechaDescarga + '.pdf', :type=>"application/pdf" )
					end
				end
			end
	end

  
  def exportar_csv # => Exportar CSV 
  	listaOrdeneslecturas= Array.new
  	rutaNombre = ""
    ordenesLecturas = OrdenLectura.where(rutum_id: params[:ruta], tipo_lectura_id: params[:proceso]).order(:posicion)
  	ordenesLecturas.each do |l|
			rutaNombre = l.rutum.codigo_nombre
			listaOrdeneslecturas.push([l.rutum.porcion.zona.codigo_nombre,l.rutum.porcion.codigo_nombre,l.rutum.codigo_nombre,l.comuna.nombre,l.cliente.nombre,l.cliente.numero_cliente,l.secuencia_lector,l.direccion,l.medidor.numero_medidor,l.detalle_orden_lectura.take.rango_inferior,l.detalle_orden_lectura.take.rango_superior, l.detalle_orden_lectura.take.lectura_anterior])
		end
		cabecera = "Región,Porción,Ruta, Comuna,Cliente,Nº Cliente,Correlativo,Dirección,Nº Medidor, Rango Superior, Rango Inferior, Lectura Anterior\n"
		fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
		nombreArchivo = "ruta_" + rutaNombre + "_" +  fechaDescarga + ".csv"
		File.open(nombreArchivo, "w+:UTF-16LE:UTF-8") do |fila|
    	fila << cabecera
      listaOrdeneslecturas.each do |l|
      	fila << l[0].to_s + "," + l[1].to_s + "," + l[2].to_s + "," +l[3].to_s + "," + l[4].to_s + "," + l[5].to_s + "," +l[6].to_s + "," + l[7].to_s + "," + l[8].to_s + "," + l[9].to_s + "," + l[10].to_s + ","+ l[11].to_s + "," + "\n"
      end
    end 
  send_file(nombreArchivo, x_sendfile: true, buffer_size: 512)
end


end
