class Api::IntentosController < Api::ApplicationController
  before_action :set_intento, only: [:show, :edit, :update, :destroy]
  respond_to :json
  
  # GET /intentos
  # GET /intentos.json
  def index
    @intentos = Intento.all
  end

  # GET /intentos/1
  # GET /intentos/1.json
  def show
  end

  # GET /intentos/new
  def new
    @intento = Intento.new
  end

  # GET /intentos/1/edit
  def edit
  end

  # POST /intentos
  # POST /intentos.json
  def create
    
    p params.inspect
    @intento = Intento.new(intento_params)

    respond_to do |format|
      if @intento.save
        format.json { render json: @intento, status: :created }
      else
        format.json { render json: @intento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intentos/1
  # PATCH/PUT /intentos/1.json
  def update
    respond_to do |format|
      if @intento.update(intento_params)
        format.html { redirect_to @intento, notice: 'Intento was successfully updated.' }
        format.json { render :show, status: :ok, location: @intento }
      else
        format.html { render :edit }
        format.json { render json: @intento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intentos/1
  # DELETE /intentos/1.json
  def destroy
    @intento.destroy
    respond_to do |format|
      format.html { redirect_to intentos_url, notice: 'Intento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intento
      @intento = Intento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intento_params
      params.require(:intento).permit(:detalle_orden_lectura_id, :lectura)
    end
end
