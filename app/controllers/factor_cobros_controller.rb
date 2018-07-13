class FactorCobrosController < ApplicationController
  before_action :set_factor_cobro, only: [:show, :edit, :update, :destroy]

  # => Carga los Tramos por Factor de Cobro
  respond_to :js, :html, :json
  def carga_tramos
    t = Tramo.where(factor_cobro_id: params[:factor].to_i).first
    @tarifa = t.factor_cobro.nombre
    @tramos = Tramo.where(factor_cobro_id: params[:factor].to_i)
    respond_with @tramos   
  end


  # GET /factor_cobros
  # GET /factor_cobros.json
  def index
    @factor_cobros = FactorCobro.all
  end

  # GET /factor_cobros/1
  # GET /factor_cobros/1.json
  def show
  end

 

  # GET /factor_cobros/new
  def new
    @factor_cobro = FactorCobro.new
    @subempresa = Subempresa.all
  end

  # GET /factor_cobros/1/edit
  def edit
  end

  # POST /factor_cobros
  # POST /factor_cobros.json
  def create
    @factor_cobro = FactorCobro.new(factor_cobro_params)

    respond_to do |format|
      if @factor_cobro.save
        format.html { redirect_to factor_cobros_path}
      else
        format.html { render :new }
        format.json { render json: @factor_cobro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factor_cobros/1
  # PATCH/PUT /factor_cobros/1.json
  def update
    respond_to do |format|
      if @factor_cobro.update(factor_cobro_params)
             format.html { redirect_to factor_cobros_path}
      else
        format.html { render :edit }
        format.json { render json: @factor_cobro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factor_cobros/1
  # DELETE /factor_cobros/1.json
  def destroy
    @factor_cobro.destroy
    respond_to do |format|
      format.html { redirect_to factor_cobros_url, notice: 'Factor cobro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factor_cobro
      @factor_cobro = FactorCobro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factor_cobro_params
      params.require(:factor_cobro).permit(:nombre,:subempresa_id, :sector_id, :tipo_sector_id, :tipo_tarifa_id, :cargo_fijo, :cargo_unico, :cargo_energia_base, :cargo_energia_adicional, :precio_energia_inyectada)
    end
end
