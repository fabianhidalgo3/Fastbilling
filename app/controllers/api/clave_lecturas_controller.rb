class Api::ClaveLecturasController < Api::ApplicationController
  before_action :set_clave_lectura, only: [:show, :edit, :update, :destroy]
  

  # GET /clave_lecturas
  # GET /clave_lecturas.json
  def index
    @clave_lecturas = ClaveLectura.all
    respond_to do |format|
      format.json { render :json => @clave_lecturas }
    end
  end

  # GET /clave_lecturas/1
  # GET /clave_lecturas/1.json
  def show
  end

  # GET /clave_lecturas/new
  def new
    @clave_lectura = ClaveLectura.new
  end

  # GET /clave_lecturas/1/edit
  def edit
  end

  # POST /clave_lecturas
  # POST /clave_lecturas.json
  def create
    @clave_lectura = ClaveLectura.new(clave_lectura_params)

    respond_to do |format|
      if @clave_lectura.save
        format.html { redirect_to @clave_lectura, notice: 'Clave lectura was successfully created.' }
        format.json { render :show, status: :created, location: @clave_lectura }
      else
        format.html { render :new }
        format.json { render json: @clave_lectura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clave_lecturas/1
  # PATCH/PUT /clave_lecturas/1.json
  def update
    respond_to do |format|
      if @clave_lectura.update(clave_lectura_params)
        format.html { redirect_to @clave_lectura, notice: 'Clave lectura was successfully updated.' }
        format.json { render :show, status: :ok, location: @clave_lectura }
      else
        format.html { render :edit }
        format.json { render json: @clave_lectura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clave_lecturas/1
  # DELETE /clave_lecturas/1.json
  def destroy
    @clave_lectura.destroy
    respond_to do |format|
      format.html { redirect_to clave_lecturas_url, notice: 'Clave lectura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clave_lectura
      @clave_lectura = ClaveLectura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clave_lectura_params
      params.require(:clave_lectura).permit(:nombre, :tipo_cobro_id)
    end
end
