class Api::AsignacionRepartosController < Api::ApplicationController

  def index
    @asignaciones = AsignacionReparto.joins(:empleado, :orden_reparto).where(empleados:{usuario_id: params[:id]}, orden_repartos:{estado_reparto_id: 2})
    
    respond_to do |format|
      format.json { render :json => @asignaciones }
    end
  end

end
