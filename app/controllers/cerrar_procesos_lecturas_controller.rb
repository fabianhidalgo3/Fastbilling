class CerrarProcesosLecturasController < ApplicationController
	def index
		user = current_usuario
		@zonas = user.empleado.zona
	end

	respond_to :js, :html, :json	
	def carga_filtro 
		@lista = Array.new
		porciones = Porcion.where(zona_id: params[:zona], abierto: true)
		porciones.each do |p|
			total_porcion = OrdenLectura.where(relectura:false).joins(:rutum).where(ruta: {porcion_id: p.id}).group(:estado_lectura_id).count
			p total_porcion
			asignado = OrdenLectura.where(estado_lectura_id: [2..5],relectura:false).joins(:rutum).where(ruta: {porcion_id: p.id}).count
			pendientes = OrdenLectura.where(estado_lectura_id: [1..3], relectura:false).joins(:rutum).where(ruta: {porcion_id: p.id}).count
			leido = OrdenLectura.where(estado_lectura_id: [4], relectura:false).joins(:rutum).where(ruta: {porcion_id: p.id}).count
			total_rutas = Rutum.where(porcion_id: p.id).count
			total_ordenes = OrdenLectura.where(estado_lectura_id: [1..5], relectura:false).joins(:rutum).where(ruta: {porcion_id: p.id}).count
			@lista.push([p.codigo_nombre,total_rutas, total_ordenes,pendientes,total_porcion[1],asignado,total_porcion[3],total_porcion[4],p.abierto])
		end	
		respond_with @lista		
	end
end
