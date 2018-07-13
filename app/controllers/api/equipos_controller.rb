class Api::EquiposController < Api::ApplicationController
  before_action :set_equipo, only: [:show, :edit, :update, :destroy]

  # GET /equipos
  # GET /equipos.json
  def index
    @equipos = Equipo.where(mac: params[:mac])
    respond_to do |format|
      format.json { render :json => @equipos }
    end
  end
end
