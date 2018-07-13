class ReporteControlHorasTerrenoController < ApplicationController
	def index
		user = current_usuario
    @zonas = user.empleado.zona
    @tipo_lectura = TipoLectura.all
	end
	# => Carga Porciones
	respond_to :js, :html, :json
	def carga_porciones
		@porciones = Porcion.where(zona_id: params[:zona])
		respond_with @porciones
	end

	# => Carga Comunas
	respond_to :js, :html, :json
	def carga_comunas
		@comunas = Comuna.where(zona_id: params[:zona])
		respond_with @comunas
	end
	# > Metodo encargado de listar usarios devuelve objeto de usuarios
	respond_to :js, :html, :json
	def carga_empleados
		# > Busca los empleados  por zona y perfil 6, 7
    porcion = Porcion.where(id: params[:porcion]).take
		if !porcion.nil?
			@empleados = porcion.zona.empleado.joins(:usuario).where(usuarios: {perfil_id: [6,7]})
		end
    respond_with @empleados
	end


	def carga_filtro
		porcion = Porcion.where(id: params[:porcion].to_i).take
		p porcion
		if !porcion.nil?
			listaEmpleados = porcion.zona.empleado.joins(:usuario).where(usuarios: {perfil_id: [6,7]})
			p listaEmpleados
		end
   	@lista = Array.new
		 
		 listaEmpleados.each do |empleado|
				asignaciones = Asignacion.where(empleado_id: empleado.id).joins(:porcion, 
					:orden_lectura).where(porcions: { id: porcion.id},
					orden_lecturas:{estado_lectura_id: [4,5]}).group(:rutum_id)
					p asignaciones.count
			p asignaciones
			asignaciones.each do |asignacion|									
				ruta = asignacion.rutum
				p asignacion.orden_lectura.detalle_orden_lectura
			if asignacion.orden_lectura.detalle_orden_lectura.first.fecha_ejecucion =! nil 
					ordenes = OrdenLectura.where(estado_lectura_id: [4,5]).joins(:asignacion, 
						:detalle_orden_lectura).where(asignacions: {empleado_id: asignacion.empleado_id, rutum_id: ruta.id}).order(
							"detalle_orden_lecturas.fecha_ejecucion ASC")

						p ordenes.count 
			hora_inicio = ordenes.first.detalle_orden_lectura.take.fecha_ejecucion
			hora_termino = ordenes.last.detalle_orden_lectura.take.fecha_ejecucion
		end
				asignado = OrdenLectura.where(rutum_id: ruta.id, estado_lectura_id: [2..5]).joins(:asignacion, :detalle_orden_lectura).where(asignacions: {empleado_id: asignacion.empleado_id}).order("detalle_orden_lecturas.fecha_ejecucion ASC").count
				total = hora_termino - hora_inicio
				mm, ss = total.divmod(60)
				hh, mm = mm.divmod(60)
				if hh == 0
					hh = "00"
				end
				if mm == 0
					mm = "00"
				end
				
				@lista.push([ruta.porcion.codigo_nombre,empleado.nombre_completo, ruta.codigo_nombre,asignado, hora_inicio.strftime("%H:%M:%S %d/%m/%Y"), hora_termino.strftime("%H:%M:%S %d/%m/%Y"), "%s:%s:%d" % [hh, mm, ss]])
			end 
		end
		# > Ordena Lista por Nombre Ruta
		@lista.sort! {|a,b| a[3] <=> b[3]}
		@lista = @lista.paginate(:page => params[:page], :per_page => 5) 
  	respond_with @lista
	end
end
