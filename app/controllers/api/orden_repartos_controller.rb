class Api::OrdenRepartosController < Api::ApplicationController
  before_action :set_orden_reparto, only: [:show, :edit, :update, :destroy]

  # GET /orden_repartos
  # GET /orden_repartos.json
  def index
    @orden_repartos = OrdenReparto.find(params[:id])
    respond_to do |format|
      format.json { render :json => @orden_repartos.as_json(root: true, include: [:cliente, :instalacion, :ruta_reparto]) }
    end
  end

  # GET /orden_repartos/1
  # GET /orden_repartos/1.json
  def show
  end

  # GET /orden_repartos/new
  def new
    @orden_reparto = OrdenReparto.new
  end

  # GET /orden_repartos/1/edit
  def edit
  end

  # POST /orden_repartos
  # POST /orden_repartos.json
  def create
    @orden_reparto = OrdenReparto.new(orden_reparto_params)

    respond_to do |format|
      if @orden_reparto.save
        format.html { redirect_to @orden_reparto, notice: 'Orden reparto was successfully created.' }
        format.json { render :show, status: :created, location: @orden_reparto }
      else
        format.html { render :new }
        format.json { render json: @orden_reparto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_repartos/1
  # PATCH/PUT /orden_repartos/1.json
  def update
    p params.inspect
    @ordenReparto = OrdenReparto.find(params[:orden_reparto_id])

    p @ordenReparto
    if !@ordenReparto.nil? && params[:estado_id].to_i == 3
      @ordenReparto.update(:estado_reparto_id => 3)
      @ordenReparto.save
    end
    if !@ordenReparto.nil? && params[:estado_id].to_i == 4
      @ordenReparto.update(:estado_reparto_id => params[:estado_id],
        :gps_latitud => params[:gps_latitud], :gps_longitud => params[:gps_longitud],
        :fecha_entrega => params[:fecha_entrega])
      @ordenReparto.save
    end
    p @ordenReparto
     respond_to do |format|
       if @ordenReparto.save
        format.json { render json: @ordenReparto , status: :ok}
       else
         format.json { render json: @ordenReparto.errors, status: :unprocessable_entity }
       end
      end
  end

  # DELETE /orden_repartos/1
  # DELETE /orden_repartos/1.json
  def destroy
    @orden_reparto.destroy
    respond_to do |format|
      format.html { redirect_to orden_repartos_url, notice: 'Orden reparto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_reparto
      @orden_reparto = OrdenReparto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_reparto_params
      params.require(:orden_reparto).permit(:numero_interno, :numero_boleta, :tipo_documento_id, :fecha_emision, :fecha_vencimiento, :fecha_entrega, :total_pago, :orden_ruta, :correlativo_impresion, :direccion_entrega, :comuna_id, :cliente_id, :ruta_reparto_id, :estado_reparto_id, :tipo_reparto_id, :tipo_entrega_id, :observacion_reparto_id, :gps_latitud, :gps_longitud )
    end
end
