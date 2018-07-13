class BienvenidaController < ApplicationController
	def index
		
		user = current_usuario
		zonas = user.empleado.zona
		
		# > Grafico Asignado Vs Cargado
		ordenLecturas = OrdenLectura.where(relectura:false).group(:estado_lectura_id).count
		 
		if ordenLecturas[1].nil?#O.ls sin asignar
			@olSinAsignar = 0
		else
			@olSinAsignar = ordenLecturas[1].to_i
		end
		p @olSinAsignar
		if ordenLecturas[2].nil? #o.ls asignadas
			@olAsignadas = 0
		else
			@olAsignadas = ordenLecturas[2].to_i
		end
		
		if ordenLecturas[3].nil?#ols cargadas
			@olCargadas = 0
		else
			@olCargadas = ordenLecturas[3].to_i
		end
		
		if ordenLecturas[4].nil?#ols leidas
			@olLeidas = 0
		else
			@olLeidas = ordenLecturas[4].to_i
		end
		
		# > Ordenes de Reaprto
		ordenRepartos = OrdenReparto.group(:estado_reparto_id).count
		 
		if ordenRepartos[1].nil?#O.ls sin asignar
			@orSinAsignar = 0
		else
			@orSinAsignar = ordenRepartos[1].to_i
		end
		if ordenRepartos[2].nil? #o.ls asignadas
			@orAsignadas = 0
		else
			@orAsignadas = ordenRepartos[2].to_i
		end
		
		if ordenRepartos[3].nil?#ols cargadas
			@orCargadas = 0
		else
			@orCargadas = ordenRepartos[3].to_i
		end
		
		if ordenRepartos[4].nil?#ols leidas
			@orLeidas = 0
		else
			@orLeidas = ordenRepartos[4].to_i
		end
		 
		@olEfectivas = Asignacion.joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5] , 
			relectura: false}, clave_lecturas: {efectivo: true}).count
		@olVerificacion = Asignacion.joins(:orden_lectura => [:detalle_orden_lectura]).where(orden_lecturas: {tipo_lectura_id: [2], 
				estado_lectura_id: [1..3], relectura: false}).count
		@olDudosas = 0
		porciones = Porcion.where(zona_id: zonas)
		rutas = Rutum.where(porcion_id: porciones)
	
		orden = OrdenLectura.where(rutum_id: rutas, estado_lectura_id: 4, 
				autorizado_facturacion: false, tipo_lectura_id: 1, 
				relectura: false).joins(:detalle_orden_lectura => :clave_lectura).where(
				clave_lecturas: {requerido: true})
			
			orden.each do |o|
			asignacion = o.asignacion
			detalle = o.detalle_orden_lectura
			detalle.each do |d|
				lectura_esperada_maxima = d.rango_superior#(d.lectura_anterior + d.lectura_promedio) * 1.05
				lectura_esperada_minima = d.rango_inferior#(d.lectura_anterior + d.lectura_promedio) * 0.95
				lectura_actual = d.lectura_actual
					# > Lectura Maxima
					if (lectura_esperada_maxima < lectura_actual) then
						@olDudosas = @olDudosas + 1
					end
					# > Lectura Minima
					if (lectura_esperada_minima > lectura_actual) then
						@olDudosas = @olDudosas + 1
					end
				end
			end
		end

		# > Descargar Manual Aplicación Web
		def descargar_manual_web
			send_file "#{Rails.root}/public/Manuales/web.pdf", type: "application/pdf", x_sendfile: true
		end

		# > Descargar Manual Aplicación Movíl
		def descargar_manual_app
			send_file "#{Rails.root}/public/Manuales/app.pdf", type: "application/pdf", x_sendfile: true
		end
	
end
