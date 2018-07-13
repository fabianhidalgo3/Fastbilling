class PerfilsController < ApplicationController

	# > Controlador perfiles de usuario
	# > Index
  def index
    @perfiles = Perfil.all
    @usuariosCount = Usuario.all.count
  end

  # > Get
 	# > Exportar CSV
  def exportar_csv
  	# Información del Archivo
    cabecera = "Código, Nombre, Cantidad de Usuarios\n"
    fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
    nombreArchivo = "perfiles_usuario_" +  fechaDescarga.to_s + ".csv"
    totalUsuario = 0
    perfiles = Perfil.all
    File.open(nombreArchivo, "w+:UTF-16LE:UTF-8") do |csv|
     	csv << cabecera
      perfiles.each do |p|
        csv << p.id.to_s + "," + p.nombre + "," + p.usuario.count.to_s + "\n"
        totalUsuario = totalUsuario + p.usuario.count
      end
      csv << " " + "," + "Total de usuarios:" + "," + totalUsuario.to_s
    end
    send_file(nombreArchivo, x_sendfile: true, buffer_size: 512)
  end

  # > Get
  # > Exportar PDF
  def exportar_pdf
  	# Información del Archivo
    fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
		nombreArchivo = "perfiles_usuario_" +  fechaDescarga.to_s + ".pdf"
		# Se Crea lista
    listaPerfiles = Array.new
    perfiles = Perfil.all
    p perfiles
    # Se llena la lista
    perfiles.each do |perfil|
      listaPerfiles.push([perfil.id, perfil.nombre, perfil.usuario.count])
    end
    respond_to do |format|
			format.pdf do
        pdf = PerfilesPdf.new(listaPerfiles)  
        send_data pdf.render, filename: nombreArchivo, type: 'application/pdf'
			end
		end
  end

end


