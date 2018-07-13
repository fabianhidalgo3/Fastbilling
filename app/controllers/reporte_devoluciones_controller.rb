class ReporteDevolucionesController < ApplicationController
	def index
		user = current_usuario
		@zonas = user.empleado.zona
	end
	
	respond_to :js, :html, :json
	def carga_filtro
		porciones = PorcionReparto.where(
			zona_id: params[:zona], estado: false
		)
		porciones.each do |p|
			@ordenesReparto = OrdenReparto.where(
				estado_reparto_id: 5).joins(:ruta_reparto).where(
				ruta_repartos: {porcion_reparto_id: p.id}
			)
		end
		respond_with @ordenesReparto
	end
end
