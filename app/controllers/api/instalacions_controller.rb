class Api::InstalacionsController < Api::ApplicationController
  before_action :set_instalacion, only: [:show, :edit, :update, :destroy]

  # GET /instalacions
  # GET /instalacions.json
  def index
    @instalacion = Instalacion.find(params[:id])
    respond_to do |format|
      format.json { render :json => @instalacion }
    end
  end
end
