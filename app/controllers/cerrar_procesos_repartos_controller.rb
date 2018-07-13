class CerrarProcesosRepartosController < ApplicationController
	def index
		user = current_usuario
		@zonas = user.empleado.zona
	end

	respond_to :js, :html, :json		
	def carga_filtro
		@lista = Array.new
		porciones = PorcionReparto.where(zona_id: params[:zona], abierto: true)
		p porciones
		porciones.each do |p|
			total_porcion = OrdenReparto.joins(:ruta_reparto).where(ruta_repartos: {porcion_reparto_id: p.id}).group(:estado_reparto_id).count
			pendientes = OrdenReparto.where(estado_reparto_id: [1..3]).joins(:ruta_reparto).where(ruta_repartos: {porcion_reparto_id: p.id}).count
			leido = OrdenReparto.where(estado_reparto_id: [4]).joins(:ruta_reparto).where(ruta_repartos: {porcion_reparto_id: p.id}).count
			total_rutas = RutaReparto.where(porcion_reparto_id: p.id).count
			total_ordenes = OrdenReparto.where(estado_reparto_id: [1..5]).joins(:ruta_reparto).where(ruta_repartos: {porcion_reparto_id: p.id}).count
			devoluciones = OrdenReparto.where(estado_reparto_id: [5]).joins(:ruta_reparto).where(ruta_repartos: {porcion_reparto_id: p.id}).count			
			@lista.push([
				p.codigo_nombre,total_rutas, total_ordenes,
				pendientes,total_porcion[1],total_porcion[2],
				total_porcion[3],total_porcion[4],p.abierto, total_porcion[5]
			])
		end	
		respond_with @lista		
	end
end
