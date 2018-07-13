class Api::ObservacionesController < Api::ApplicationController
  before_action :set_observacione, only: [:show, :edit, :update, :destroy]

  # GET /observaciones
  # GET /observaciones.json
  def index
    @observaciones = Observacione.all
    respond_to do |format|
      format.json { render :json => @observaciones }
    end
  end

  # GET /observaciones/1
  # GET /observaciones/1.json
  def show
  end

  # GET /observaciones/new
  def new
    @observacione = Observacione.new
  end

  # GET /observaciones/1/edit
  def edit
  end

  # POST /observaciones
  # POST /observaciones.json
  def create
    @observacione = Observacione.new(observacione_params)

    respond_to do |format|
      if @observacione.save
        format.html { redirect_to @observacione, notice: 'Observacione was successfully created.' }
        format.json { render :show, status: :created, location: @observacione }
      else
        format.html { render :new }
        format.json { render json: @observacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observaciones/1
  # PATCH/PUT /observaciones/1.json
  def update
    respond_to do |format|
      if @observacione.update(observacione_params)
        format.html { redirect_to @observacione, notice: 'Observacione was successfully updated.' }
        format.json { render :show, status: :ok, location: @observacione }
      else
        format.html { render :edit }
        format.json { render json: @observacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observaciones/1
  # DELETE /observaciones/1.json
  def destroy
    @observacione.destroy
    respond_to do |format|
      format.html { redirect_to observaciones_url, notice: 'Observacione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observacione
      @observacione = Observacione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observacione_params
      params.require(:observacione).permit(:descripcion, :clave_lectura_id)
    end
end
