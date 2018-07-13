class RutaRepartosController < ApplicationController
  before_action :set_ruta_reparto, only: [:show, :edit, :update, :destroy]

  # GET /ruta_repartos
  # GET /ruta_repartos.json
  def index
    @ruta_repartos = RutaReparto.all
  end

  # GET /ruta_repartos/1
  # GET /ruta_repartos/1.json
  def show
  end

  # GET /ruta_repartos/new
  def new
    @ruta_reparto = RutaReparto.new
  end

  # GET /ruta_repartos/1/edit
  def edit
  end

  # POST /ruta_repartos
  # POST /ruta_repartos.json
  def create
    @ruta_reparto = RutaReparto.new(ruta_reparto_params)

    respond_to do |format|
      if @ruta_reparto.save
        format.html { redirect_to @ruta_reparto, notice: 'Ruta reparto was successfully created.' }
        format.json { render :show, status: :created, location: @ruta_reparto }
      else
        format.html { render :new }
        format.json { render json: @ruta_reparto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruta_repartos/1
  # PATCH/PUT /ruta_repartos/1.json
  def update
    respond_to do |format|
      if @ruta_reparto.update(ruta_reparto_params)
        format.html { redirect_to @ruta_reparto, notice: 'Ruta reparto was successfully updated.' }
        format.json { render :show, status: :ok, location: @ruta_reparto }
      else
        format.html { render :edit }
        format.json { render json: @ruta_reparto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruta_repartos/1
  # DELETE /ruta_repartos/1.json
  def destroy
    @ruta_reparto.destroy
    respond_to do |format|
      format.html { redirect_to ruta_repartos_url, notice: 'Ruta reparto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruta_reparto
      @ruta_reparto = RutaReparto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ruta_reparto_params
      params.require(:ruta_reparto).permit(:codigo, :nombre, :porcion_reparto_id)
    end
end
