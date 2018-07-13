class ClientesRepasoController < ApplicationController
	def index
		@ordenes = Asignacion.joins(:orden_lectura).where(orden_lecturas:{tipo_lectura_id: [2], estado_lectura_id: [2..3]}).paginate(:page => params[:page], :per_page => 10)
		p @ordenes.first
  end
end
