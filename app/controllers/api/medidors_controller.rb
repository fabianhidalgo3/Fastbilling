class Api::MedidorsController < Api::ApplicationController
  before_action :set_medidor, only: [:show, :edit, :update, :destroy]

  # GET /medidors
  # GET /medidors.json
  def index
    @medidor = Medidor.find(params[:id])

    if @medidor.propiedad_cliente.nil?
      @medidor.propiedad_cliente = true
    end

    if @medidor.modelo_id.nil?
      @medidor.modelo_id = 0
    end

    if @medidor.nro_digitos.nil?
      @medidor.nro_digitos = 0
    end
    
    if @medidor.diametro.nil?
      @medidor.diametro = 0
    end
    respond_to do |format|
      format.json { render :json => @medidor }
    end
  end
end
