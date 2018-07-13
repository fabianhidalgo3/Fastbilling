class ReporteLlenadoEstanquesController < ApplicationController
  respond_to :js
  def index
    user = current_usuario	# > Busca usuario y zonas y porcion del usuario logueado
    @zonas = user.empleado.zona
  end

  def porciones 
   @porciones = Porcion.where(zona_id: params[:zona])
   respond_with @porciones
  end
end
