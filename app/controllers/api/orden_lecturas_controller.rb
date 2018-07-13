class Api::OrdenLecturasController < Api::ApplicationController
  before_action :set_orden_lectura, only: [:show, :edit, :update, :destroy]

  # GET /orden_lecturas
  # GET /orden_lecturas.json
  def index
    @orden_lectura = OrdenLectura.find(params[:id])

    respond_to do |format|
      format.json { render :json => @orden_lectura.as_json(root: true, include: [:instalacion, :cliente, :medidor, :rutum, :detalle_orden_lectura]) }
    end
  end

  # GET /orden_lecturas/1
  # GET /orden_lecturas/1.json
  def show
  end

  # GET /orden_lecturas/new
  def new
    @orden_lectura = OrdenLectura.new
  end

  # GET /orden_lecturas/1/edit
  def edit
  end

  # POST /orden_lecturas
  # POST /orden_lecturas.json
  def create
    @orden_lectura = OrdenLectura.new(orden_lectura_params)

    respond_to do |format|
      if @orden_lectura.save
        format.html { redirect_to @orden_lectura, notice: 'Orden lectura was successfully created.' }
        format.json { render :show, status: :created, location: @orden_lectura }
      else
        format.html { render :new }
        format.json { render json: @orden_lectura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_lecturas/1
  # PATCH/PUT /orden_lecturas/1.json
  def update
    @orden_lectura = OrdenLectura.find(params[:orden_lectura_id])
    if @orden_lectura.estado_lectura_id != 1
      @orden_lectura.estado_lectura_id = params[:estado_id]
      if !params[:gps_latitud].nil?
        @orden_lectura.gps_latitud = params[:gps_latitud]
      end
      if !params[:gps_longitud].nil?
        @orden_lectura.gps_longitud = params[:gps_longitud]
      end
      if !params[:folio_casa_cerrada].nil?
        @orden_lectura.folio_casa_cerrada = params[:folio_casa_cerrada]
      end

      @orden_lectura.autorizado_facturacion = params[:autorizado_facturacion]
      @orden_lectura.facturado = params[:facturado]
    end
    respond_to do |format|
      if @orden_lectura.save
        format.json { render json: @orden_lectura , status: :ok}
      else
        format.json { render json: @orden_lectura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_lecturas/1
  # DELETE /orden_lecturas/1.json
  def destroy
    @orden_lectura.destroy
    respond_to do |format|
      format.html { redirect_to orden_lecturas_url, notice: 'Orden lectura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_lectura
      @orden_lectura = OrdenLectura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_lectura_params
      #params.require(:orden_lectura).permit(:codigo, :posicion, :direccion, :direccion_entrega, :numero_poste, :fecha_carga, :fecha_propuesta, :fecha_asignacion, :gps_latitud, :gps_longitud, :ajuste_sencillo_anterior, :ajuste_sencillo_actual, :instalacion_id, :medidor_id, :cliente_id, :sap_id, :rutum_id, :tipo_lectura_id, :estado_lectura_id, :tipo_tarifa_id, :localidad_id, :tipo_entrega_id, :tipo_establecimiento_id)
    end
end
