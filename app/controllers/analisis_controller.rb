class AnalisisController < ApplicationController

  # => Guarda Nueva Lectura con estado Relectura y la Asigna a un Lector
  respond_to :js, :html, :json
  def relectura
    @completado = Array.new
    # > Busco la orden
		ordenLectura = OrdenLectura.where(id: params[:orden_id]).take
    
    # > Creo la nueva orden lectura en estado de Verificación 
    nuevaOrdenLectura = OrdenLectura.create(:codigo => ordenLectura.codigo, :posicion => ordenLectura.posicion, 
      :secuencia_lector => ordenLectura.posicion, :direccion => ordenLectura.direccion, :direccion_entrega => ordenLectura.direccion_entrega, 
      :numero_poste => ordenLectura.numero_poste, :fecha_carga => ordenLectura.fecha_carga, 
      :fecha_propuesta => ordenLectura.fecha_propuesta, :fecha_asignacion => Time.zone.now, 
      :instalacion_id => ordenLectura.instalacion_id,:medidor_id => ordenLectura.medidor_id, 
      :cliente_id => ordenLectura.cliente_id, :rutum_id => ordenLectura.rutum_id, :estado_lectura_id => 2, 
      :tipo_lectura_id => 2, :tipo_tarifa_id => 1, :tipo_entrega_id => 1, 
      :tipo_establecimiento_id => 1, :nro_municipal => ordenLectura.nro_municipal, :comuna_id => ordenLectura.comuna_id, 
      :relectura => false, :analisis => params[:analisis].to_i)
    nuevaOrdenLectura.save
    p nuevaOrdenLectura.id
    # > Creo el detalle de la orden lectura a verificacón
    nuevoDetalleOrdenLectura = DetalleOrdenLectura.create(:orden_lectura_id => nuevaOrdenLectura.id,
      :numerador_id => ordenLectura.detalle_orden_lectura.first.numerador_id,
      :lectura_anterior => ordenLectura.detalle_orden_lectura.first.lectura_anterior, 
      :lectura_promedio => ordenLectura.detalle_orden_lectura.first.lectura_promedio,
      :clave_lectura_anterior => ordenLectura.detalle_orden_lectura.first.clave_lectura_anterior)
    nuevoDetalleOrdenLectura.save
    # > Asigna la Verificación a un Empleado
    nuevaAsignacion = Asignacion.create(:rutum_id => ordenLectura.rutum_id, :porcion_id => ordenLectura.rutum.porcion.id,
      :orden_lectura_id  => nuevaOrdenLectura.id, :empleado_id => params[:lector].to_i)
		nuevaAsignacion.save
    ordenLectura.update(:relectura => true)
    ordenLectura.save
    @completado.push([1, params[:analisis].to_i])
    respond_with @completado
  end

  # => autoriza_Facturacion
  respond_to :js, :html, :json
  def autoriza_facturacion
    @orden = OrdenLectura.where(id: params[:orden_id]).first
    @orden.autorizado_facturacion = true
    @orden.save
    @completado = [true, params[:analisis].to_i]
    respond_with @completado
  end

  # => Releer
  respond_to :js, :html, :json
  def releer
    @analisis = params[:analisis]
    @orden = OrdenLectura.where(id: params[:orden]).first
    @detalle = DetalleOrdenLectura.where(orden_lectura_id: @orden.id).first
    zona = @orden.rutum.porcion.zona
    @lectores = zona.empleado.joins(:usuario).where(usuarios: {perfil_id: [6..7]})
    respond_with @orden
  end

  # => Carga la fotografia de los analisis dudosos
  def carga_fotografia
    detalle = DetalleOrdenLectura.where(orden_lectura_id: params[:id_orden]).first
    @numero_cliente = detalle.orden_lectura.cliente.numero_cliente 
    @lista_fotos = Fotografium.where(detalle_orden_lectura_id: detalle.id)
    respond_with @lista_fotos
  end

	# => Modulo Clientes dudosos 
	def dudosos
		user = current_usuario
    @zonas = user.empleado.zona
    @porcion = Porcion.where(zona_id: @zonas)
    @tipo_lectura = TipoLectura.all
  	@region = Region.all
	end

	# => Modulo Clientes improcedentes
	def improcedentes
		user = current_usuario
    @zonas = user.empleado.zona
    @porcion = Porcion.where(zona_id: @zonas)
    @tipo_lectura = TipoLectura.all
    @region = Region.all
	end

	# => Carga Comunas por Región y Zona
	respond_to :js, :html, :json
	def carga_comuna
		user = current_usuario
    @zonas = user.empleado.zona
		@comuna = Comuna.where(
			zona_id: @zonas).joins(:provincium).where(provincia: {region_id: params[:region].to_i}
		)
		respond_with @comuna
	end

	# => Lista de datos Carga Dudosos maximos y minimos.
  respond_to :js, :html, :json
	def carga_dudosos
    @lista = Array.new
    porciones = Porcion.where(zona_id: params[:zona])
    desde = DateTime.parse(params[:desde])
    hasta = DateTime.parse(params[:hasta])
    rutas = Rutum.where(porcion_id: params[:porcion])
    orden = OrdenLectura.where(rutum_id: rutas, estado_lectura_id: 4, 
      autorizado_facturacion: false, tipo_lectura_id: params[:proceso], 
      relectura: false).joins(:detalle_orden_lectura => :clave_lectura).where(
      clave_lecturas: {id: [1..3]})
    
      orden.each do |o|
      asignacion = o.asignacion
      detalle = o.detalle_orden_lectura.where(fecha_ejecucion: desde..hasta)
      detalle.each do |d|
        lectura_anterior = d.lectura_anterior
	      lectura_actual = d.lectura_actual
	      lectura_promedio = d.lectura_promedio
	      lectura_esperada_maxima = d.rango_superior#(d.lectura_anterior + d.lectura_promedio) * 1.05
        lectura_esperada_minima = d.rango_inferior#(d.lectura_anterior + d.lectura_promedio) * 0.95
	      consumo = d.lectura_actual - d.lectura_anterior
	      clave_lectura = d.clave_lectura.nombre
	      observacion = ""
        clave_anterior = d.clave_lectura_anterior

	      if !d.lectura_promedio.nil? then
	      	lectura_promedio = d.lectura_promedio
	      else
	      	lectura_promedio = 0
	      end
        # > Lectura Maxima
        if (lectura_esperada_maxima < lectura_actual) then
        	@lista.push([o.cliente.nombre,o.cliente.numero_cliente, o.rutum.codigo,
                      asignacion.empleado.nombre_completo, lectura_promedio,lectura_anterior,
                      lectura_actual, consumo, lectura_esperada_maxima.to_i, clave_lectura,
                      observacion, o.id, d.fotografium.blank?, clave_anterior, o.medidor.numero_medidor, o.lectura_dictada])
        end
        # > Lectura Minima
        if (lectura_esperada_minima > lectura_actual) then
        	@lista.push([o.cliente.nombre,o.cliente.numero_cliente, o.rutum.codigo,
                      asignacion.empleado.nombre_completo, lectura_promedio,lectura_anterior,
                      lectura_actual, consumo, lectura_esperada_minima.to_i, clave_lectura,
                      observacion, o.id, d.fotografium.blank?, clave_anterior, o.medidor.numero_medidor, o.lectura_dictada])
        end
      end
    end
    @lista = @lista.paginate(:page => params[:page], :per_page => 10)
    respond_with @lista
	end

  # => Lista de datos. improcedentes
  respond_to :js, :html, :json
	def carga_improcedentes
    @lista = Array.new
    rutas = Rutum.where(porcion_id: params[:porcion])
    orden = OrdenLectura.where(rutum_id: rutas, estado_lectura_id: 4, 
      autorizado_facturacion: false, tipo_lectura_id: params[:proceso], 
      relectura: false).joins(:detalle_orden_lectura => :clave_lectura).where(
      clave_lecturas: {id: [4..6]})
   
      orden.each do |o|
      desde = DateTime.parse(params[:desde])
      hasta = DateTime.parse(params[:hasta])
      asignacion = o.asignacion
      detalle = o.detalle_orden_lectura.where(fecha_ejecucion: desde..hasta)
      detalle.each do |d|
        lectura_anterior = d.lectura_anterior
        lectura_actual = d.lectura_actual
        lectura_promedio = d.lectura_promedio
        lectura_esperada_maxima = (d.lectura_anterior + d.lectura_promedio) * 1.05
        lectura_esperada_minima = (d.lectura_anterior + d.lectura_promedio) * 0.95
        consumo = d.lectura_actual - d.lectura_anterior
        clave_lectura = d.clave_lectura.nombre
        observacion = ""
        clave_anterior = d.clave_lectura_anterior

        if !d.lectura_promedio.nil? then
          lectura_promedio = d.lectura_promedio
        else
          lectura_promedio = 0
        end
        @lista.push([o.cliente.nombre,o.cliente.numero_cliente, o.rutum.codigo,
                      asignacion.empleado.nombre_completo, lectura_promedio,lectura_anterior,
                      lectura_actual, consumo, lectura_esperada_minima.to_i, clave_lectura,
                      observacion, o.id, d.fotografium.blank?, clave_anterior, o.medidor.numero_medidor, o.lectura_dictada])
        
      end
    end
    @lista = @lista.paginate(:page => params[:page], :per_page => 10)
    respond_with @lista
	end

  # > Busco Orden Lectura a Modificar
  respond_to :js, :html, :json
  def modificar_lectura
    @orden_lectura = DetalleOrdenLectura.where(orden_lectura_id: params[:id_orden].to_i).first
  end

  # > Guardo lectura Actual Modificada
  respond_to :js, :html, :json
  def guardar_lectura
    @orden_lectura = DetalleOrdenLectura.where(orden_lectura_id: params[:id].to_i).first
    @orden_lectura.update(:lectura_actual => params[:lectura])
    @orden_lectura.save
  end

end
