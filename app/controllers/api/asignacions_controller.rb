class Api::AsignacionsController < Api::ApplicationController
  before_action :set_asignacion, only: [:show, :edit, :update, :destroy]
  # GET /asignacions
  # GET /asignacions.json
  
  def index
    @asignacions = Asignacion.joins(:empleado, :orden_lectura).where(empleados:{usuario_id: params[:id]}, orden_lecturas:{estado_lectura_id: 2})
    respond_to do |format|
      format.json { render :json => @asignacions }
    end
  end

  def desasignacion
    @asignacions = Asignacion.joins(:empleado, :orden_lectura).where(empleados:{usuario_id: params[:id]}, orden_lecturas:{id: params[:orden_id]}).first
    if @asignacions.nil?
      @asignacions = Asignacion.new
    end

    respond_to do |format|
      format.json { render :json => @asignacions }
    end
  end
end
