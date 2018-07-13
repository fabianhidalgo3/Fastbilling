class Api::ClientesController < Api::ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  # GET /clientes.json
  def index
    @cliente = Cliente.find(params[:id])
    respond_to do |format|
      format.json { render :json => @cliente }
    end
	end

end
