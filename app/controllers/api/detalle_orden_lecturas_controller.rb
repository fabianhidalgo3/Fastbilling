class Api::DetalleOrdenLecturasController < Api::ApplicationController
  before_action :set_detalle_orden_lectura, only: [:show, :edit, :update, :destroy]

  # GET /detalle_orden_lecturas
  # GET /detalle_orden_lecturas.json
  def index
    @detalle_orden_lectura = DetalleOrdenLectura.where(id: params[:id]).first
    respond_to do |format|
      format.json { render :json => @detalle_orden_lectura }
    end
  end

  # GET /detalle_orden_lecturas/1
  # GET /detalle_orden_lecturas/1.json
  def show
  end

  # GET /detalle_orden_lecturas/new
  def new
    @detalle_orden_lectura = DetalleOrdenLectura.new
  end

  # GET /detalle_orden_lecturas/1/edit
  def edit
  end

  # POST /detalle_orden_lecturas
  # POST /detalle_orden_lecturas.json
  def create
    @detalle_orden_lectura = DetalleOrdenLectura.new(detalle_orden_lectura_params)

    respond_to do |format|
      if @detalle_orden_lectura.save
        format.json { render :show, status: :created, location: @detalle_orden_lectura }
      else
        format.json { render json: @detalle_orden_lectura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_orden_lecturas/1
  # PATCH/PUT /detalle_orden_lecturas/1.json
  def update
  
    @detalle_orden_lectura = DetalleOrdenLectura.where(id: params[:detalle_orden_lectura_id]).first
    @detalle_orden_lectura.fecha_ejecucion = params[:fecha_ejecucion]
    @detalle_orden_lectura.lectura_actual = params[:lectura_actual]

    if params[:clave_lectura_id] != 0
      @detalle_orden_lectura.clave_lectura_id = params[:clave_lectura_id]
    end
    if params[:observacion_id] != 0
      @detalle_orden_lectura.observacione_id = params[:observacion_id]
    end

    @detalle_orden_lectura.save
    
    respond_to do |format|
      if @detalle_orden_lectura.update(detalle_orden_lectura_params)
        format.json { render json: @detalle_orden_lectura, status: :ok}
      else
        format.json { render json: @detalle_orden_lectura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_orden_lecturas/1
  # DELETE /detalle_orden_lecturas/1.json
  def destroy
    @detalle_orden_lectura.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_orden_lectura
      @detalle_orden_lectura = DetalleOrdenLectura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_orden_lectura_params
      params.require(:detalle_orden_lectura).permit(:orden_lectura_id, :numerador_id, :lectura_anterior, :lectura_promedio, :lectura_actual, :rango_superior, :rango_inferior, :fecha_ejecucion, :clave_lectura_id, :observacion_id)
    end
end
