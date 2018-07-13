class ClaveLecturasController < ApplicationController
  
  def index
		@clave_lecturas = ClaveLectura.paginate(:page => params[:page], :per_page => 10)
		@totalClaves = ClaveLectura.all.count
		@totalObservaciones = Observacione.all.count
  end

  # > Get 
  # > Exportar CSV
  def exportar_csv
    listaClavelecturas = Array.new
    claveLecturas = Observacione.all
    claveLecturas.each do |c|
      if (c.clave_lectura.requerido)
        requerido =  "Si"
      else
        requerido ="No"
			end
      if (c.clave_lectura.efectivo)
        efectivo =  "Si"
      else
        efectivo ="No"
      end
      listaClavelecturas.push([c.clave_lectura.nombre, c.codigo_ptc, c.codigo, c.descripcion, requerido,efectivo])
    end    
    cabecera = "Clave Lectura, Código PTC, Código, Descripción, Lectura Requerida, Lectura Efectiva\n"
    fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
    nombreArchivo = "claves_lecturas_ "+fechaDescarga+".csv"
    File.open(nombreArchivo, "w+:UTF-16LE:UTF-8") do |fila|
      fila << cabecera
      listaClavelecturas.each do |l|
        fila << l[0].to_s + "," + l[1].to_s + "," + l[2].to_s + "," + l[3].to_s + "," + l[4].to_s + "," + l[5].to_s + "\n"
      end
    end
    send_file(nombreArchivo, x_sendfile: true, buffer_size: 512)
  end

  # > Get
  # > Exportar PDF
  def exportar_pdf
  	# Informacion del Archivo
    fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
    nombreArchivo = "clave_lecturas_ "+fechaDescarga+".pdf"
  	listaClaves = Observacione.all
		respond_to do |format|
			format.pdf do
        pdf = ClaveLecturasPdf.new(listaClaves)  
        send_data pdf.render, filename: nombreArchivo, type: 'application/pdf'
			end
		end
  end

end
