class DevolucionesController < ApplicationController
	
	def index
	end

	respond_to :js, :html, :json
	def carga_filtro
		@observaciones = ObservacionReparto.all			
		@ordenesReparto = OrdenReparto.where(
			estado_reparto_id: [2,3], numero_boleta: params[:documento]
		)
		p @ordenesReparto
		respond_with @ordenesReparto
	end

	respond_to :js, :html, :json	
	def crear_devolucion 
		ordenReparto = OrdenReparto.where(id: params[:id_orden]).first
		ordenReparto.update(observacion_reparto_id: params[:observacion], estado_reparto_id: 5)
		#flash[:notice] = "test"
		render :carga_filtro
		#flash.clear

	end
	
end
