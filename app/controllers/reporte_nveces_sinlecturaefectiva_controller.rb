class ReporteNvecesSinlecturaefectivaController < ApplicationController
	def index
		# Busca usuario y zonas y porcion del usuario logueado
		user = current_usuario
    	@zonas = user.empleado.zona
	end

	respond_to :js, :html, :json
	def carga_porciones
		@porciones = Porcion.where(zona_id: params[:zona], abierto: true)
		respond_with @porciones
	end

	respond_to :js, :html, :json
	def carga_comunas
		@comunas = Comuna.where(zona_id: params[:zona])
		respond_with @comunas
	end

	respond_to :js, :html, :json 
	def carga_filtro
		@lista = Array.new
		rutas = Rutum.where(porcion_id: params[:porcion])
		listaOrdenes = OrdenLectura.where(estado_lectura_id: [4,5],rutum_id: rutas, comuna_id: params[:comuna]).joins(:detalle_orden_lectura).where(
			 detalle_orden_lecturas:{clave_lectura_id: [12..19]})
			p listaOrdenes
			listaOrdenes.each do |l|
			p	l.id
			end
		respond_with @lista
	end
end
