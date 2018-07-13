class TipoRepartosController < ApplicationController
  before_action :set_tipo_reparto, only: [:show, :edit, :update, :destroy]

  # GET /tipo_repartos
  # GET /tipo_repartos.json
  def index
    @tipo_repartos = TipoReparto.all
  end

  # GET /tipo_repartos/1
  # GET /tipo_repartos/1.json
  def show
  end

  # GET /tipo_repartos/new
  def new
    @tipo_reparto = TipoReparto.new
  end

  # GET /tipo_repartos/1/edit
  def edit
  end

  # POST /tipo_repartos
  # POST /tipo_repartos.json
  def create
    @tipo_reparto = TipoReparto.new(tipo_reparto_params)

    respond_to do |format|
      if @tipo_reparto.save
        format.html { redirect_to @tipo_reparto, notice: 'Tipo reparto was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_reparto }
      else
        format.html { render :new }
        format.json { render json: @tipo_reparto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_repartos/1
  # PATCH/PUT /tipo_repartos/1.json
  def update
    respond_to do |format|
      if @tipo_reparto.update(tipo_reparto_params)
        format.html { redirect_to @tipo_reparto, notice: 'Tipo reparto was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_reparto }
      else
        format.html { render :edit }
        format.json { render json: @tipo_reparto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_repartos/1
  # DELETE /tipo_repartos/1.json
  def destroy
    @tipo_reparto.destroy
    respond_to do |format|
      format.html { redirect_to tipo_repartos_url, notice: 'Tipo reparto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_reparto
      @tipo_reparto = TipoReparto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_reparto_params
      params.require(:tipo_reparto).permit(:descripcion)
    end
end
