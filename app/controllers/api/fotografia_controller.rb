class Api::FotografiaController < Api::ApplicationController
  before_action :set_fotografium, only: [:show, :edit, :update, :destroy]

  # GET /fotografia
  # GET /fotografia.json
  def index
    @fotografia = Fotografium.all
  end

  # GET /fotografia/1
  # GET /fotografia/1.json
  def show
  end

  # GET /fotografia/new
  def new
    @fotografium = Fotografium.new
  end

  # GET /fotografia/1/edit
  def edit
  end

  # POST /fotografia
  # POST /fotografia.json
  def create
    data = params[:fotografia] #Datos de la fotografia en base64
    nombre_archivo = "public/images/fotografia/"+params[:nombre_archivo]+".jpeg"
    
    File.open(nombre_archivo, 'wb'){|f| f.write(Base64.decode64(data))}
    @fotografia = Fotografium.new(detalle_orden_lectura_id: params[:detalle_orden_lectura_id], archivo: "fotografia/"+params[:nombre_archivo]+".jpeg", descripcion: params[:observacion])
    
    respond_to do |format|
      if @fotografia.save
        format.json { render json: @fotografia, status: :created}
      else
        format.json { render json: @fotografia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fotografia/1
  # PATCH/PUT /fotografia/1.json
  def update
    respond_to do |format|
      if @fotografium.update(fotografium_params)
        format.html { redirect_to @fotografium, notice: 'Fotografium was successfully updated.' }
        format.json { render :show, status: :ok, location: @fotografium }
      else
        format.html { render :edit }
        format.json { render json: @fotografium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fotografia/1
  # DELETE /fotografia/1.json
  def destroy
    @fotografium.destroy
    respond_to do |format|
      format.html { redirect_to fotografia_url, notice: 'Fotografium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fotografium
      @fotografium = Fotografium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fotografium_params
      params.require(:fotografium).permit(:detalle_orden_lectura_id, :archivo, :descripcion)
    end
end
