class PorcionRepartosController < ApplicationController
  before_action :set_porcion_reparto, only: [:show, :edit, :update, :destroy]

  # GET /porcion_repartos
  # GET /porcion_repartos.json
  def index
    @porcion_repartos = PorcionReparto.all
  end

  # GET /porcion_repartos/1
  # GET /porcion_repartos/1.json
  def show
  end

  # GET /porcion_repartos/new
  def new
    @porcion_reparto = PorcionReparto.new
  end

  # GET /porcion_repartos/1/edit
  def edit
  end

  # POST /porcion_repartos
  # POST /porcion_repartos.json
  def create
    @porcion_reparto = PorcionReparto.new(porcion_reparto_params)

    respond_to do |format|
      if @porcion_reparto.save
        format.html { redirect_to @porcion_reparto, notice: 'Porcion reparto was successfully created.' }
        format.json { render :show, status: :created, location: @porcion_reparto }
      else
        format.html { render :new }
        format.json { render json: @porcion_reparto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /porcion_repartos/1
  # PATCH/PUT /porcion_repartos/1.json
  def update
    respond_to do |format|
      if @porcion_reparto.update(porcion_reparto_params)
        format.html { redirect_to @porcion_reparto, notice: 'Porcion reparto was successfully updated.' }
        format.json { render :show, status: :ok, location: @porcion_reparto }
      else
        format.html { render :edit }
        format.json { render json: @porcion_reparto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /porcion_repartos/1
  # DELETE /porcion_repartos/1.json
  def destroy
    @porcion_reparto.destroy
    respond_to do |format|
      format.html { redirect_to porcion_repartos_url, notice: 'Porcion reparto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_porcion_reparto
      @porcion_reparto = PorcionReparto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def porcion_reparto_params
      params.require(:porcion_reparto).permit(:codigo, :nombre, :ano, :mes, :zona_id, :subempresa_id)
    end
end
