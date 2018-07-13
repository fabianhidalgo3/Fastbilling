class CompletitudLecturasController < ApplicationController
	def index
		@lista = Array.new #se crea lista
		user = current_usuario #usuario logeado
		zonas = user.empleado.zona # zonas vinculadas del usuario
		fecha = Time.zone.now
		resumenLecturas = ResumenLectura.all
		porciones = Porcion.where(zona_id: zonas, abierto: true)		
		porciones.each do |p|
			total_porcion = OrdenLectura.joins(:rutum).where(ruta: {porcion_id: p.id}).group(:estado_lectura_id).count
			pendientes = OrdenLectura.where(estado_lectura_id: [1..3]).joins(:rutum).where(ruta: {porcion_id: p.id}).count
			leido = OrdenLectura.where(estado_lectura_id: [4]).joins(:rutum).where(ruta: {porcion_id: p.id}).count
			total_rutas = Rutum.where(porcion_id: p.id).count
			total_ordenes = OrdenLectura.where(estado_lectura_id: [1..5]).joins(:rutum).where(ruta: {porcion_id: p.id}).count
			@lista.push([p.codigo_nombre,total_rutas, total_ordenes,pendientes,total_porcion[1],total_porcion[2],total_porcion[3],total_porcion[4],p.abierto])
		end	
		p @lista
	end
end
