class MonitorLectoresController < ApplicationController

	#Muestra los Filtros del Monitor
	def index
		user = current_usuario
    @zonas = user.empleado.zona
	end

  #Carga las porciones de la zona
	respond_to :js, :html, :json
  def carga_porciones
    @porciones = Porcion.where(zona_id: params[:zona])
    respond_with @porciones
  end

  # => Monitor Lectores -> Carga lista ubicacion para monitor lectores
  respond_to :js, :html, :json
  def carga_ubicacion
    ubicaciones = Array.new
    asignacion = OrdenLectura.where(rutum_id: params[:ruta_id], estado_lectura_id: [4,5]).joins(:asignacion, :detalle_orden_lectura).where(asignacions: {empleado_id: params[:emp_id]}).order("detalle_orden_lecturas.fecha_ejecucion ASC")
    asignacion.each do |a|
      if (!a.gps_latitud.nil? && !a.gps_longitud.nil?) && (a.gps_latitud.to_i != 0  && a.gps_longitud.to_i != 0)
        detalle = a.detalle_orden_lectura.take#DetalleOrdenLectura.where(orden_lectura_id: a.id).first
        ventana = "N Cliente: " + a.cliente.numero_cliente.to_s + "\n" + 
                  detalle.fecha_ejecucion.strftime('%e/%m/%Y %I:%M:%S %p')
        ubicaciones.push([a.gps_latitud, a.gps_longitud, ventana])
      end
    end
    @hash = Gmaps4rails.build_markers(ubicaciones) do |u, marker|
      marker.lat u[0]
      marker.lng u[1]
      marker.infowindow u[2]
    end
    respond_with @hash
  end

  # => Carga Filtros del index
  respond_to :js, :html, :json
  def carga_filtro
    @lista = Array.new
    @totales = Array.new
		porciones = Porcion.where(zona_id: params[:zona])
    inicio = DateTime.parse(params[:desde] + " 00:00:00");
    termino = DateTime.parse(params[:hasta] + " 23:59:59");
    tAsignado = 0
    tCargado = 0
    tPendiente = 0
    tEfectivo = 0
    tNoEfectivo = 0
    tLeido = 0
    tVerificaciones = 0
    tEfectividad = 0
    asignado = 0
    cargado = 0
    efectivo = 0 
    noEfectivo = 0 
    pendientes = 0 
    leido = 0 
    ol_repaso = 0
    efectividad = 0
    empleados = Empleado.joins(:usuario, :asignacion).where(usuarios: {perfil_id: [6,7]}, asignacions: {porcion_id: porciones}).group(:id) 
    empleados.each do |empleado|
    	asignaciones = Asignacion.where(empleado_id: empleado.id).joins(:porcion, :orden_lectura).where(
                    porcions:{ id: porciones },orden_lecturas:{estado_lectura_id: [2..5],:fecha_asignacion => inicio..termino }).group(:rutum_id)
      p asignaciones
                    asignaciones.each do |asignacion|
			  asignado = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(
                  :orden_lectura => [:detalle_orden_lectura]).where(orden_lecturas: {estado_lectura_id: [2,3,4,5], relectura: false}).count
        p asignado
        cargado = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(
                  :orden_lectura => [:detalle_orden_lectura]).where(orden_lecturas: {estado_lectura_id: [3], relectura: false}).count
        p cargado
        efectivo = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(
                  :orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5] , 
                  relectura: false}, clave_lecturas: {efectivo: true}).count
        noEfectivo = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(
                  :orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5], 
                  relectura: false}, clave_lecturas: {efectivo: false}).count
        pendientes = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(
                  :orden_lectura).where(orden_lecturas: {estado_lectura_id: [2,3], relectura: false}).count
        leido = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(
                :orden_lectura).where(orden_lecturas: {estado_lectura_id: 4, relectura: false}).count
				ol_repaso = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(
                    :orden_lectura => [:detalle_orden_lectura]).where(orden_lecturas: {tipo_lectura_id: [2], 
                    estado_lectura_id: [1..3], relectura: false}).count
        efectividad = ((efectivo*100.0)/asignado).round(2)
        hora = OrdenLectura.where(rutum_id: asignacion.rutum_id, estado_lectura_id: [4,5]).joins(:asignacion, 
              :detalle_orden_lectura).where(asignacions: {empleado_id: asignacion.empleado_id}).order("detalle_orden_lecturas.fecha_ejecucion ASC")
        if !hora.blank? then
          horaInicio = hora.first.detalle_orden_lectura.first.fecha_ejecucion.strftime("%H:%M:%S %d/%m/%Y")
          horaTermino = hora.last.detalle_orden_lectura.first.fecha_ejecucion.strftime("%H:%M:%S %d/%m/%Y")
        else
          horaInicio = " "
          horaTermino = " "
        end  
        transmitido = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(
                      :orden_lectura).where(orden_lecturas: {estado_lectura_id: 5, relectura: false}).count    
        @lista.push([empleado.nombre_completo, asignacion.orden_lectura.rutum.codigo_nombre, asignado,
                    cargado, efectivo, noEfectivo, pendientes, leido, efectividad, horaInicio, horaTermino,
                    transmitido, asignacion.rutum_id, asignacion.empleado_id, ol_repaso, asignacion.orden_lectura.rutum.porcion.codigo_nombre])
      end
      tAsignado = tAsignado+ asignado
      tCargado = tCargado+ cargado 
      tPendiente = tPendiente + pendientes
      tEfectivo =  tEfectivo + efectivo
      tNoEfectivo = tNoEfectivo + noEfectivo
      tLeido = tLeido + leido
      tVerificaciones = tVerificaciones + ol_repaso
      tEfectividad = tEfectividad + efectividad
    end  
    @totales.push(tAsignado)
    @totales.push(tCargado)
    @totales.push(tPendiente)
    @totales.push(tEfectivo)
    @totales.push(tNoEfectivo)
    @totales.push(tLeido)
    @totales.push(tVerificaciones)
    @totales.push(tEfectividad)

    @lista.sort! {|a,b| a[0] <=> b[1]}
    respond_with @lista
  end
end
