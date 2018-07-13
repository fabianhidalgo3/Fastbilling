class Api::RutaController < Api::ApplicationController
  before_action :set_rutum, only: [:show, :edit, :update, :destroy]

  # GET /ruta
  # GET /ruta.json
  def index
    @ruta = Rutum.find(params[:id])
    respond_to do |format|
      format.json { render :json => @ruta }
    end
  end
end
