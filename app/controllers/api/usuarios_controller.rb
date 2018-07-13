class Api::UsuariosController < Api::ApplicationController

  def index
    empleado  = Empleado.find(params[:id])
    @usuario = empleado.usuario
    respond_to do |format|
      format.json { render :json => @usuario }
    end
  end

end
