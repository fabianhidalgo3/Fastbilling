class UsuariosAgentesTerrenoController < ApplicationController

  def index
		@usuarios = Usuario.where(perfil_id: [6..8]).paginate(:page => params[:page], :per_page => 7)
		fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
		respond_to do |format|
			format.html
			format.json
		end
  end

  def modificar_contrasena # Formulario Cambiar Contraseña
		@usuario = Usuario.where(id: params[:usuario_id]).first
	end

	def cambiar #post
		usuario = Usuario.where(id: params[:id]).first
		usuario.update(password: params[:password])
		if usuario.perfil.id == 1 || usuario.perfil.id == 2 || usuario.perfil.id == 3 || usuario.perfil.id == 4 || usuario.perfil.id == 5 
			redirect_to  action: 'usuarios_administrativos'
		else
			redirect_to action: 'usuarios_terreno'
		end
	end

	# > Exporta en Formato CSV
  def exportar_csv
    listaUsuariostrabajadores = Array.new
    usuarios = Usuario.where(perfil_id: [6..8])
    usuarios.each do |u|
      if !u.empleado.equipo.nil? then
      	listaUsuariostrabajadores.push([u.empleado.nombre_completo, u.empleado.subempresa.razon_social,u.perfil.nombre, u.empleado.rut, u.email, u.empleado.equipo.mac])
      else
      	listaUsuariostrabajadores.push([u.empleado.nombre_completo, u.empleado.subempresa.razon_social,u.perfil.nombre, u.empleado.rut, u.email, ""])
      end
    end
	  cabecera = "Nombre, Empresa, Perfil, Rut Trabajador, Nombre Usuario, Equipo\n"
		fechaDescarga = Time.now.strftime("%d-%m-%Y_%H%M%S").to_s
    nombreArchivo = "usuariosAgentesterreno_"+fechaDescarga+".csv"
		File.open(nombreArchivo, "w+:UTF-16LE:UTF-8") do |fila|
    	fila << cabecera
      listaUsuariostrabajadores.each do |l|
      	fila << l[0].to_s + "," + l[1].to_s + "," + l[2].to_s + "," + l[3].to_s + "," + l[4].to_s + "," + l[5].to_s + "\n"
      end
    end
    send_file(nombreArchivo, x_sendfile: true, buffer_size: 512)
	end
	
	# > Exporta en Formato PDF
	def exportar_pdf
		fechaDescarga = Time.zone.now.strftime("%d-%m-%Y_%H%M%S").to_s
		nombreArchivo = "usuarios_agentes_terreno_" +  fechaDescarga.to_s + ".pdf"
		listaUsuariosAgenteTerreno = Array.new
    usuarios = Usuario.where(perfil_id: [6..7])
		usuarios.each do |u|
			if !u.empleado.nil?
      	listaUsuariosAgenteTerreno.push([u.empleado.nombre_completo, u.empleado.subempresa.razon_social, u.perfil.nombre, u.empleado.rut, u.email, u.empleado.equipo.mac])
			else
				listaUsuariosAgenteTerreno.push(["", "", u.perfil.nombre, "", u.email])
			end
		end
    respond_to do |format|
			format.pdf do
        pdf = UsuariosAgenteTerrenoPdf.new(listaUsuariosAgenteTerreno)  
				send_data pdf.render,
					filename: nombreArchivo,
          type: 'application/pdf'
			end
		end
	end

end
