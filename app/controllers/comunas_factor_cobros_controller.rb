class ComunasFactorCobrosController < ApplicationController
  before_action :set_factor_comuna, only: [:show, :edit, :update, :destroy]

  # GET /factor_comunas
  # GET /factor_comunas.json
  def index
    @factor = FactorCobro.all
  end

  # GET /factor_comunas/1
  # GET /factor_comunas/1.json
  def show
  end

  # => GET Carga Provincias
  respond_to :js, :html, :json
  def carga_provincias
    @provincias = Provincium.where(region_id: params[:region])
    respond_with @porciones    
  end

   # => GET Carga Comunas
   # => Filtra solo Comunas sin Factor de Cobros
  respond_to :js, :html, :json
  def carga_comunas
    @comunas = Array.new
    lista_comunas = Comuna.where(provincium_id: params[:provincia])
    p lista_comunas
    lista_comunas.each do |comuna|
      if comuna.factor_cobro.blank?
        @comunas.push([comuna.id, comuna.nombre])
      end

    end
    respond_with @comunas   
  end

  # GET /factor_comunas/new
  def new
    @regiones= Region.all
    @factorCobro = FactorCobro.all
  end

  # GET /factor_comunas/1/edit
  def edit
  end

  # POST /factor_comunas
  # POST /factor_comunas.json
  def create
    comuna_ids = params[:comuna_ids]
    comuna_ids.each do |comuna|
      factor_comuna = ComunasFactorCobros.new(factor_cobro_id: params[:Tarifa], comuna_id: comuna)
      factor_comuna.save
    end
    respond_to do |format|
      format.html { redirect_to factor_cobros_url }
    end
  end

  # PATCH/PUT /factor_comunas/1
  # PATCH/PUT /factor_comunas/1.json
  def update
    respond_to do |format|
      if @factor_comuna.update(factor_comuna_params)
        format.html { redirect_to @factor_comuna, notice: 'Factor comuna was successfully updated.' }
        format.json { render :show, status: :ok, location: @factor_comuna }
      else
        format.html { render :edit }
        format.json { render json: @factor_comuna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factor_comunas/1
  # DELETE /factor_comunas/1.json
  def destroy
    @factor_comuna.destroy
    respond_to do |format|
      format.html { redirect_to factor_comunas_url, notice: 'Factor comuna was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factor_comuna
      @factor_comuna = FactorComuna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factor_comuna_params
      params.require(:factor_comuna).permit(:factor_cobro_id, :comuna_id)
    end
end
