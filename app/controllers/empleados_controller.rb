class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :edit, :update, :destroy]

  # GET /empleados
  # GET /empleados.json
  def index
    @empleados = Empleado.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /empleados/1
  # GET /empleados/1.json
  def show
  end

  # GET /empleados/new
  def new
    @empleado = Empleado.new
    @contratistas = Contratistum.all
  end

  # GET /empleados/1/edit
  def edit
    @contratistas = Contratistum.all
    @subempresa = Subempresa.where(id: @empleado.subempresa_id).first
    @subempresas = Contratistum.where(id: @empleado.contratistum_id).first.subempresa
    @zonas = @subempresa.zona

  end

  # POST /empleados
  # POST /empleados.json
  def create
    @usuario = Usuario.new(email: params[:email], password: params[:password], perfil_id: params[:Perfil])
    @usuario.save
    @empleado = Empleado.new(nombre: params[:nombre], apellido_paterno: params[:apellido_paterno],
                               apellido_materno: params[:apellido_materno], rut: params[:rut],
                               contratistum_id: params[:Contratista], subempresa_id: params[:SubEmpresa])
    @empleado.update(:usuario_id => @usuario.id)
    if @usuario.perfil_id == 6 || @usuario.perfil_id == 7
      equipo = Equipo.new(
				nombre: params[:nombre_equipo],
				mac: params[:mac],
				modelo_id: params[:Modelo],
				empleado_id: @empleado.id).save # > Guardo Equipo Agentes Terreno
    end

		zona_ids = params[:zona_ids]
    if !zona_ids.nil?
      zona_ids.each do |zona_id|
        EmpleadosZonas.new(empleado_id: @empleado.id, zona_id: zona_id).save
      end
    end

    respond_to do |format|
      if @empleado.save
        format.html { redirect_to empleados_url }
        #format.html { redirect_to @empleado, notice: 'Empleado was successfully created.' }
        #format.json { render :show, status: :created, location: @empleado }
      else
        format.html { render :new }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empleados/1
  # PATCH/PUT /empleados/1.json
  def update
    respond_to do |format|
      if @empleado.update(empleado_params)
        format.html { redirect_to @empleado, notice: 'Empleado was successfully updated.' }
        format.json { render :show, status: :ok, location: @empleado }
      else
        format.html { render :edit }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /empleados/1
  # DELETE /empleados/1.json
  def destroy
    #Busca si el existen usuarios vinculados y lo elimina
    if !@empleado.usuario.nil?
      usuario = Usuario.where(id: @empleado.usuario_id).first
      @empleado.update(usuario_id: "")
      usuario.destroy
    end

    #Busca si existen equipos vinculados y lo desvincula
    if !@empleado.equipo.nil?
      equipo = Equipo.where(id: @empleado.equipo.id).first
      equipo.update(empleado_id: "")
    end

    #Elimina el Empleado
    @empleado.destroy

    respond_to do |format|
      format.html { redirect_to empleados_url, notice: 'Empleado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  respond_to :js, :html, :json
  def carga_subempresas
    @subempresas =  Contratistum.where(id: params[:contratista]).first.subempresa
    respond_with @subempresas
  end

  respond_to :js, :html, :json
  def carga_equipos
    @perfil = params[:perfil]
  end

  respond_to :js, :html, :json
  def carga_zonas
    subempresa=Subempresa.where(id: params[:subempresa]).first
    if !subempresa.nil?
      @zonas = subempresa.zona
    end
    respond_with @zonas
  end

  respond_to :js, :html, :json
  def carga_modelos
    @modelos = Modelo.where(marca_id: params[:marca])
    p @modelos
    respond_with @modelos
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empleado
      @empleado = Empleado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empleado_params
      params.require(:empleado).permit(:nombre, :apellido_paterno, :apellido_materno, :rut, :contratistum_id, :subempresa_id)
    end
end
