class AsignacionRepartosController < ApplicationController
  respond_to :js, :html, :json

  def index
    user = current_usuario #Usuario Loggeado 
    @zonas = user.empleado.zona #Zonas del Usuario
    @tipo_reparto = TipoReparto.all
    @estados = EstadoReparto.where(id: [1,2])
  end

  def porciones
    zona = params[:zona]
    if zona != ""
      @porciones = PorcionReparto.where(zona_id: zona).order("CAST(codigo AS UNSIGNED)")
      respond_with @porciones
    end
  end

 
  def tabla_contenido # => Lista Ordenes Asignadas y No Asignadas
    @lista = Array.new
    zona = Zona.where(id: params[:zona]).first
    if !zona.nil?
      @listaEmpleados = zona.empleado.joins(:usuario).where(usuarios: {perfil_id: [6,7]})
    end
  
    # > Ordenes de Reparto sin Asignación
    if params[:estado].to_i == 1
      @variable = 0 # Valida en la vista para mostrar el filtro de Ordenes de Reparto
      listaRutas = RutaReparto.where(porcion_reparto_id: params[:porcion]) #Busco Rutas de la Porción
      listaRutas.each do |ruta| #Recorro Rutas
        listaOrdenes = OrdenReparto.where(ruta_reparto_id: ruta.id,tipo_reparto_id: params[:proceso], estado_reparto_id: 1)
        if listaOrdenes.count > 0
         		fila = Array.new
         		fila.push(ruta.porcion_reparto.codigo) #Codigo Porción
         		fila.push(ruta.codigo)#Codigo Ruta 
         		fila.push(listaOrdenes.first.comuna.nombre)# Comuna
         		fila.push(listaOrdenes.count)#cantidad de documentos
            fila.push(listaOrdenes.where(tipo_documento:1).count) #FACTURAS
         		fila.push(listaOrdenes.where(tipo_documento:3).count) #BOLETAS 
            fila.push(listaOrdenes.where(tipo_documento:5).count) #NOTA DEBITO
         		fila.push(listaOrdenes.where(tipo_documento:6).count) #NOTA CREDITO
         		fila.push(ruta.id)
         		fila.push(listaOrdenes.first.tipo_reparto_id)
            @lista.push(fila)
            @lista.sort! {|a,b| a[1] <=> b[1]} #Ordeno Lista
        end
      end
    end
   
    if params[:estado].to_i == 2
      @variable = 1 
      @listaEmpleados.each do |empleado| 

        listaAsignaciones = AsignacionReparto.where(empleado_id: empleado.id) 
          .joins(:porcion_reparto, :orden_reparto).where(porcion_repartos: 
          { zona_id: params[:zona], id: params[:porcion]}, orden_repartos:
          {estado_reparto_id: [2,3], tipo_reparto_id: params[:proceso]}).group(:ruta_reparto_id)

        if !listaAsignaciones.blank?
          listaAsignaciones.each do |asignacion|
            fila = Array.new
            fila.push(asignacion.empleado.nombre_completo)
            fila.push(asignacion.porcion_reparto.codigo_nombre)
            fila.push(asignacion.orden_reparto.ruta_reparto.codigo_nombre)
            fila.push(asignacion.orden_reparto.comuna.nombre)
            fila.push(AsignacionReparto.where(empleado_id: asignacion.empleado_id,
            					ruta_reparto_id: asignacion.ruta_reparto_id).joins(:orden_reparto).where(
            					orden_repartos:{ estado_reparto_id:[2,3]}).count)
            fila.push(AsignacionReparto.where(empleado_id: asignacion.empleado_id, 
            					ruta_reparto_id: asignacion.ruta_reparto_id).joins(:orden_reparto).where(
            					orden_repartos:{ estado_reparto_id:[2,3], tipo_documento_id: 1}).count) 
            fila.push(AsignacionReparto.where(empleado_id: asignacion.empleado_id, 
            					ruta_reparto_id: asignacion.ruta_reparto_id).joins(:orden_reparto).where(
                      orden_repartos:{ estado_reparto_id:[2,3], tipo_documento_id: 3}).count)
            fila.push(AsignacionReparto.where(empleado_id: asignacion.empleado_id, 
            					ruta_reparto_id: asignacion.ruta_reparto_id).joins(:orden_reparto).where(
                      orden_repartos:{ estado_reparto_id:[2,3], tipo_documento_id: 5}).count)
            fila.push(AsignacionReparto.where(empleado_id: asignacion.empleado_id, 
            					ruta_reparto_id: asignacion.ruta_reparto_id).joins(:orden_reparto).where(
                      orden_repartos:{ estado_reparto_id:[2,3], tipo_documento_id: 6}).count)
            fila.push(asignacion.ruta_reparto.id)
            fila.push(asignacion.orden_reparto.tipo_reparto_id)
            fila.push(asignacion.empleado_id)
            @lista.push(fila)
            @lista.sort! {|a,b| a[2] <=> b[2]}
          end
        end
      end
    end
    respond_with @lista 
  end

  
  def asignacion_completa #Asignacion completa por ruta y empleado de O.R
    ruta = RutaReparto.where(id: params[:ruta]).first
    listaOrdenes = OrdenReparto.where(ruta_reparto_id: ruta.id, estado_reparto_id: 1, tipo_reparto_id: params[:tipo_reparto].to_i)
   	totalOrdenes = listaOrdenes.count.to_s
    if !listaOrdenes.nil? || !listaOrdenes.blank?
	   	listaOrdenes.each do |o|
	      AsignacionReparto.create(orden_reparto_id: o.id, empleado_id: params[:empleado],
	        porcion_reparto_id: ruta.porcion_reparto.id, ruta_reparto_id: ruta.id)
	      o.update(estado_reparto_id: 2, fecha_asignacion: Time.zone.now)
	      o.save
	    end
	    @completado = Array.new
	    @completado.push("Asignación Completada!", "Total O.R Asignadas = " +totalOrdenes)
    	render 'alertas'	
  	end
  end

  def desasignacion_completa #Desasignacion completa por ruta y emppleado de O.R
    ruta = RutaReparto.where(id: params[:ruta]).first
    listaOrdenes = OrdenReparto.where(ruta_reparto_id: params[:ruta], estado_reparto_id: [2,3], 
      tipo_reparto_id: params[:tipo_reparto]).joins(:asignacion_reparto).where(asignacion_repartos: {empleado_id: params[:empleado].to_i, 
      porcion_reparto_id: ruta.porcion_reparto_id})
    totalOrdenes = listaOrdenes.count.to_s
   	if !listaOrdenes.nil?
   		listaOrdenes.each do |o|
      	o.asignacion_reparto.destroy
      	o.update(estado_reparto_id: 1, fecha_asignacion: "")
    	end
    	@completado = Array.new
	    @completado.push("Desasignación Completada!", "Total O.R Desasignadas: " +totalOrdenes)
    	render 'alertas'	
   	end
  end


  def dividir_ruta_asignacion
    @ruta_seleccionada = RutaReparto.where(id: params[:ruta]).first
    @lector = Empleado.where(id: params[:empleado]).first
    @ordenes_repartos = OrdenReparto.where(ruta_reparto_id: params[:ruta], estado_reparto_id: 1, tipo_reparto_id: params[:tipo_reparto])
      .order(:orden_ruta).paginate(:page => params[:page], :per_page => 100)
  end

  def asignacion_parcial
    @completado = params[:id_boton_asignacion].to_i
    ruta = RutaReparto.where(id: params[:ruta]).first
    ordenes = params[:ordenes].split(",")
    orden = ""
    ordenes.each do |orden_id|
      orden = OrdenReparto.where(id: orden_id).first
      AsignacionReparto.new(ruta_reparto_id: ruta.id, porcion_reparto_id: ruta.porcion_reparto.id, orden_reparto_id: orden.id,empleado_id: params[:empleado]).save
      orden.update(estado_reparto_id:  2, fecha_asignacion: Time.now)
      orden.save
    end
    @lector_id = Empleado.where(id: params[:empleado].to_i).first.id
    @ruta_seleccionada_id = ruta.id
    @tipo_reparto_id = orden.tipo_reparto_id
    @ordenes = ordenes.count
    respond_with @completado
  end

  def dividir_ruta_desasignacion
    @ruta_seleccionada = RutaReparto.where(id: params[:ruta]).first
    @lector = Empleado.where(id: params[:empleado]).first
    @asignaciones = AsignacionReparto.where(
      empleado_id: @lector.id, ruta_reparto_id: @ruta_seleccionada.id,
      porcion_reparto_id: @ruta_seleccionada.porcion_reparto.id).joins(:orden_reparto).where(
      orden_repartos: {tipo_reparto_id: params[:tipo_lectura],estado_reparto_id: [2,3],comuna_id: params[:comuna]}
    )
  end
  # => Guarda las Desasignaciones Parciales
  def desasignacion_parcial
    @completado_uno = 0
    ruta = RutaReparto.where(id: params[:ruta]).first
    empleado = params[:empleado]
    ordenes = params[:ordenes].split(",")
    ordenes.each do |orden_id|
       orden = OrdenReparto.find(orden_id)
       orden.asignacion_reparto.destroy
       orden.update(estado_reparto_id:1, fecha_asignacion: "")
    end
    respond_with @completado_uno
  end
  
end
