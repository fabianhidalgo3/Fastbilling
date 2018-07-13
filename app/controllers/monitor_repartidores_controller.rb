class MonitorRepartidoresController < ApplicationController
	respond_to :js, :html, :json

	def index
		user = current_usuario
    @zonas = user.empleado.zona
	end

	# > Creo lista de las Ubicaciones por Repartidos
  def carga_ubicacion
    listaUbicaciones = Array.new #Creo Array para guardar las ubicaciones del repartido
		#Buscos las OrdenReparto Completadas(4)
		ordenesCompletadas = OrdenReparto.where(
      ruta_reparto_id: params[:ruta_id], estado_reparto_id: 4).joins(
			:asignacion_reparto).where(asignacion_repartos: {empleado_id: params[:empleado_id]}).order("orden_repartos.fecha_entrega ASC")

		ordenesCompletadas.each do |orden|
      if (!orden.gps_latitud.nil? && !orden.gps_longitud.nil?) && (orden.gps_latitud.to_i != 0  && orden.gps_longitud.to_i != 0)
				#Creo Ventana a mostrar en el Mapa
        ventana = "Nº Cliente: " + orden.cliente.numero_cliente.to_s +
                  orden.fecha_entrega.strftime(' Fecha: %e/%m/%Y Hora: %I:%M:%S %p')
				#Guardo las Ubicaciones
        listaUbicaciones.push([orden.gps_longitud, orden.gps_latitud, ventana])
      end
    end
		#Creo hash con listaUbicaciones
    @hash = Gmaps4rails.build_markers(listaUbicaciones) do |u, marker|
      marker.lat u[0]
      marker.lng u[1]
      marker.infowindow u[2]
    end
    respond_with @hash
  end

  # => Muestro el contenido de la tabla
  def carga_filtro
    porciones = PorcionReparto.where(zona_id: params[:zona].to_i)
    inicio = DateTime.parse(params[:desde] + " 00:00:00");
    termino = DateTime.parse(params[:hasta] + " 23:59:59");
    empleados = Empleado.joins(:usuario, :asignacion_reparto).where(
      usuarios: {perfil_id: [6,7]}, asignacion_repartos: {porcion_reparto_id: porciones}).group(:id)
    @lista = Array.new
    empleados.each do |empleado|
      asignaciones = AsignacionReparto.where(
        empleado_id: empleado.id).joins(:porcion_reparto, :orden_reparto).where(
        porcion_repartos: { id: porciones },orden_repartos:{estado_reparto_id: [2..5],
				:fecha_asignacion => inicio..termino }).group(:ruta_reparto_id)
      asignaciones.each do |asignacion|
				asignado = AsignacionReparto.where(empleado_id: asignacion.empleado_id, ruta_reparto_id: asignacion.ruta_reparto_id).count
        cargado = AsignacionReparto.where(
          empleado_id: asignacion.empleado_id, ruta_reparto_id: asignacion.ruta_reparto_id).joins(
          :orden_reparto).where(orden_repartos: {estado_reparto_id: 3}).count
        pendientes = AsignacionReparto.where(
          empleado_id: asignacion.empleado_id, ruta_reparto_id: asignacion.ruta_reparto_id).joins(
					:orden_reparto).where(orden_repartos: {estado_reparto_id: [2,3]}).count
        leido = AsignacionReparto.where(
          empleado_id: asignacion.empleado_id, ruta_reparto_id: asignacion.ruta_reparto_id).joins(
					:orden_reparto).where(orden_repartos: {estado_reparto_id: 4}).count
				#efectividad = ((efectivo*100.0)/asignado).round(2)
        hora = OrdenReparto.where(
          ruta_reparto_id: asignacion.ruta_reparto_id, estado_reparto_id: [4,5]).joins(
          :asignacion_reparto).where(asignacion_repartos: {empleado_id: asignacion.empleado_id}).order("orden_repartos.fecha_entrega ASC")
        if !hora.blank?
          horaInicio = hora.first.fecha_entrega.strftime("%H:%M:%S %d/%m/%Y")
          horaTermino = hora.last.fecha_entrega.strftime("%H:%M:%S %d/%m/%Y")
        else
          horaInicio = " "
          horaTermino = " "
        end
        transmitido = AsignacionReparto.where(
          empleado_id: asignacion.empleado_id, ruta_reparto_id: asignacion.ruta_reparto_id).joins(
          :orden_reparto).where(orden_repartos: {estado_reparto_id: 5}).count

        @lista.push([
          empleado.nombre_completo,
					asignacion.orden_reparto.ruta_reparto.porcion_reparto.codigo_nombre,
					asignacion.orden_reparto.ruta_reparto.codigo_nombre,
					asignado,
          cargado,
					pendientes,
					leido,
					((leido*100.0)/asignado).round(2),
					horaInicio,
					horaTermino,
          transmitido, asignacion.ruta_reparto_id, asignacion.empleado_id
        ])
        p @lista
      end
    end
    @lista = @lista.paginate(:page => params[:page], :per_page => 10)
    @lista.sort! {|a,b| a[0] <=> b[1]}
    respond_with @lista
  end
end
