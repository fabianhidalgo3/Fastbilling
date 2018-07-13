class FacturacionController < ApplicationController

	def facturacion_pendiente
		ordenes = OrdenLectura.where(estado_lectura_id:[4,5])
		@orden = ordenes.paginate(:page => params[:page], :per_page => 7)
	end

	def documentos_emitidos

	end


end
