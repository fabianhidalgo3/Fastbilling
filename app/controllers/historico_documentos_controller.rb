class HistoricoDocumentosController < ApplicationController
def index
	p "test"
end

respond_to :js, :html, :json
def carga_filtro
	seleccion = params[:seleccion].to_i
	if seleccion == 1 #Busca Por Cliente
		@repartos = OrdenReparto.where(
			estado_reparto_id: [4]).joins(:cliente).where(
			clientes:{numero_cliente: params[:busqueda].to_i}
		)
	end
	respond_with @repartos
end

respond_to :js, :html, :json
def carga_fotografia
	detalle = DetalleOrdenReparto.where(orden_reparto_id: params[:id_orden]).first
	@lista_fotos = Fotografium.where(detalle_orden_reparto_id: detalle.id)
	respond_with @lista_fotos
end

end
