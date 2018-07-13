class ObservacionRepartosController < ApplicationController

  def index 
    @observacion_repartos = ObservacionReparto.paginate(:page => params[:page], :per_page => 10)
  end

  # > Exportar CSV
  def exportar_csv 
    listaObservaciones = Array.new
    fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
    observacionRepartos = ObservacionReparto.all
    observacionRepartos.each do |o|
      if (o.efectivo) then
        efectivo = "Si"
      else
        efectivo = "No"
      end
      listaObservaciones.push([o.observacion, o.codigo, efectivo])
    end
    cabecera = "Descripción, Código, Reparto Efectivo\n"
    nombreArchivo = "observacion_repartos_" +  fechaDescarga + ".csv"
    File.open(nombreArchivo, "w+:UTF-16LE:UTF-8") do |fila|
      fila << cabecera
      listaObservaciones.each do |l|
        fila << l[0].to_s + "," + l[1].to_s + "," + l[2].to_s + "," + l[3].to_s + "\n"
      end
    end 
    send_file(nombreArchivo, x_sendfile: true, buffer_size: 512)
  end

  # > Exportar PDF
  def exportar_pdf
    # Informacion del Archivo
    fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
    nombreArchivo = "observaciones_reparto "+fechaDescarga+".pdf"
  	listaObservaciones = ObservacionReparto.all
		respond_to do |format|
			format.pdf do
        pdf = ObservacionRepartoPdf.new(listaObservaciones)  
        send_data pdf.render, filename: nombreArchivo, type: 'application/pdf'
			end
		end
  end

end
