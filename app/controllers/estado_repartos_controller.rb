class EstadoRepartosController < ApplicationController
  before_action :set_estado_reparto, only: [:show, :edit, :update, :destroy]

  # GET /estado_repartos
  # GET /estado_repartos.json
  def index
    @estado_repartos = EstadoReparto.all
  end

  # GET /estado_repartos/1
  # GET /estado_repartos/1.json
  def show
  end

  # GET /estado_repartos/new
  def new
    @estado_reparto = EstadoReparto.new
  end

  # GET /estado_repartos/1/edit
  def edit
  end

  # POST /estado_repartos
  # POST /estado_repartos.json
  def create
    @estado_reparto = EstadoReparto.new(estado_reparto_params)

    respond_to do |format|
      if @estado_reparto.save
        format.html { redirect_to @estado_reparto, notice: 'Estado reparto was successfully created.' }
        format.json { render :show, status: :created, location: @estado_reparto }
      else
        format.html { render :new }
        format.json { render json: @estado_reparto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_repartos/1
  # PATCH/PUT /estado_repartos/1.json
  def update
    respond_to do |format|
      if @estado_reparto.update(estado_reparto_params)
        format.html { redirect_to @estado_reparto, notice: 'Estado reparto was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_reparto }
      else
        format.html { render :edit }
        format.json { render json: @estado_reparto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_repartos/1
  # DELETE /estado_repartos/1.json
  def destroy
    @estado_reparto.destroy
    respond_to do |format|
      format.html { redirect_to estado_repartos_url, notice: 'Estado reparto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_reparto
      @estado_reparto = EstadoReparto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_reparto_params
      params.require(:estado_reparto).permit(:estado)
    end
end
