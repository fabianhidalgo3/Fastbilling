class UsuariosAdministrativosController < ApplicationController

  # > Pagina Principal
	def index
		@usuarios = Usuario.where(perfil_id: [1..5]).paginate(:page => params[:page], :per_page => 7)
	end

  # > Get
  # > Exporta Formato CSV
  def exportar_csv
    listaUsuariosadministrativos = Array.new
    usuarios = Usuario.where(perfil_id: [1..5])
		usuarios.each do |u|
			if !u.empleado.nil?
      	listaUsuariosadministrativos.push([u.empleado.nombre_completo, u.empleado.subempresa.razon_social, u.perfil.nombre, u.empleado.rut, u.email])
			else
				listaUsuariosadministrativos.push(["", "", u.perfil.nombre, "", u.email])
			end
		end
    cabecera = "Nombre, Empresa, Perfil, Rut Trabajador, Nombre Usuario\n"
    fechaDescarga = Time.zone.now.strftime("%d-%m-%Y_%H%M%S").to_s
    nombreArchivo = "UsuariosAdministrativos_- " +  fechaDescarga + ".csv"
    File.open(nombreArchivo, "w+:UTF-16LE:UTF-8") do |fila|
      fila << cabecera
      listaUsuariosadministrativos.each do |l|
        fila << l[0].to_s + "," + l[1].to_s + "," + l[2].to_s + "," + l[3].to_s + "," + l[4].to_s + "," + l[5].to_s + "\n"
      end
    end
    send_file(nombreArchivo, x_sendfile: true, buffer_size: 512)
	end
  
  
  # > Get
  # > Exporta Formato Pdf
	def exportar_pdf
		fechaDescarga = Time.zone.now.strftime("%d-%m-%Y_%H%M%S").to_s
		nombreArchivo = "usuarios_administrativos_" +  fechaDescarga.to_s + ".pdf"
		listaUsuariosAdministrativos = Array.new
    usuarios = Usuario.where(perfil_id: [1..5])
		usuarios.each do |u|
			if !u.empleado.nil?
      	listaUsuariosAdministrativos.push([u.empleado.nombre_completo, u.empleado.subempresa.razon_social, u.perfil.nombre, u.empleado.rut, u.email])
			else
				listaUsuariosAdministrativos.push(["", "", u.perfil.nombre, "", u.email])
			end
		end
    respond_to do |format|
			format.pdf do
        pdf = UsuariosAdministrativosPdf.new(listaUsuariosAdministrativos)  
				send_data pdf.render,
					filename: nombreArchivo,
          type: 'application/pdf'
			end
		end
  end

  # > Get
  # > Formulario Cambiar Contraseña
  def modificar_contrasena 
		@usuario = Usuario.where(id: params[:usuario_id]).first
  end
  
  # > Post
  # > Actualiza Password
	def cambiar 
		usuario = Usuario.where(id: params[:id]).first
    usuario.update(password: params[:password])
    redirect_to  action: 'index'
  end

end
