class AsignacionsController < ApplicationController
  respond_to :js, :html, :json

  def index
    user = current_usuario
    @zonas = user.empleado.zona
    @porcion = Porcion.where(zona_id: @zonas)
    @tipo_lectura = TipoLectura.all
    @estados = EstadoLectura.where(id: [1,2])
  end

  # > Carga las Porciones
  def carga_porciones
    user = current_usuario
    zona = params[:zona]
    @porciones = Porcion.where(zona_id: zona)
    respond_with @porciones
  end

  def carga_filtro
    estado = params[:Estado]
    if estado.to_i == 1 # Ordenes Sin Asignación
      @variable = 0
      @empleados = Array.new
      zona = Zona.where(id: params[:zona]).first
      if !zona.nil?
        listaEmp = zona.empleado
        listaEmp.each do |empleado|
          if empleado.usuario.perfil_id == 6 || empleado.usuario.perfil_id ==7
            @empleados.push(empleado)
          end
        end
      end
      comuna = ""
      @lista = Array.new
      rutas = Rutum.where(porcion_id: params[:porcion])
      rutas.each do |r|
        ordenes = OrdenLectura.where(rutum_id: r.id, tipo_lectura_id: params[:proceso], estado_lectura_id: estado.to_i)
        if ordenes.count > 0
          @lista.push([r.porcion.codigo_nombre, ordenes.first.comuna.nombre,r.codigo_nombre, ordenes.count, "0 Hrs","0 %", r.id, ordenes.first.comuna.id])
        end
      end
    end

    #Ordenes con Asignación
    if estado.to_i == 2
    	@variable = 1 
      e = Empleado.joins(:usuario).where(usuarios: {perfil_id: [6,7]})
      @lista = Array.new
      e.each do |emp|
        asignaciones = Asignacion.where(empleado_id: emp.id).joins(:porcion, :orden_lectura).where(porcions: { zona_id: params[:zona], id: params[:porcion] },orden_lecturas:{estado_lectura_id: [2,3], tipo_lectura_id: params[:proceso]} )
				if asignaciones.count > 0
					comuna_id = ""
					comuna_nombre = ""
          ruta_nombre = ""
          porcion = ""
          ruta_id =asignaciones[0].rutum_id
          contador =0
          asignaciones.each do |asignacion|
            @zona = params[:zona]
            ruta = Rutum.where(id: ruta_id).first
            ruta_nombre = ruta.codigo
            porcion = ruta.porcion.codigo
						comuna_id = asignacion.orden_lectura.comuna.id
						comuna_nombre = asignacion.orden_lectura.comuna.codigo_nombre
            if ruta_id != asignacion.rutum_id && emp.nombre != asignacion.empleado_id
              @lista.push([porcion, comuna_nombre, ruta_nombre, contador, "0 Hrs", "0 %",emp.nombre_completo,emp.id,ruta_id, comuna_id, params[:proceso]])
              ruta_id = asignacion.rutum_id
              contador = 0
            end
            contador+=1
          end
          @lista.push([porcion, comuna_nombre, ruta_nombre, contador, "0 Hrs", "0 %",emp.nombre_completo,emp.id,ruta_id, comuna_id, params[:proceso]])
        end
      end
    end
    # @lista.sort! {|a,b| a[2] <=> b[2]}
    respond_with @lista
  end

  # => Dividir Rutas para asignacion
  def carga_dividir_ruta_asignacion
		@ruta_seleccionada = Rutum.where(id: params[:ruta]).first
    @lector = Empleado.where(id: params[:empleado]).first
    @ordenes_lectura = OrdenLectura.where(rutum_id: params[:ruta], estado_lectura_id: 1).order(
                       :posicion)
  end

  # => Dividir Rutas para Desasignacion
  def carga_dividir_ruta_desasignacion
    p "askdjaskd"
    p "tesss"
    @ruta_seleccionada = Rutum.where(id: params[:ruta]).first
    @lector = Empleado.where(id: params[:empleado]).first
    @asignaciones = Asignacion.where(empleado_id: @lector.id, rutum_id: @ruta_seleccionada.id,
      porcion_id: @ruta_seleccionada.porcion.id).joins(:orden_lectura).where(
      orden_lecturas: {tipo_lectura_id: params[:tipo_lectura], estado_lectura_id: [2,3]})
    p @asignaciones
    p "askljdalkajdlksajdlkjaksjaskdjakljlk"
  end

  # => Guarda las Asignaciónes Parciales
  def asignacion_parcial
		@completado = params[:id_boton_asignacion].to_i
    ruta = Rutum.where(id: params[:ruta]).first
    ordenes = params[:ordenes].split(",")
    ordenes.each do |orden_id|
      orden = OrdenLectura.where(id: orden_id).first
      Asignacion.new(rutum_id: ruta.id, porcion_id: ruta.porcion.id, 
                     orden_lectura_id: orden.id, empleado_id: params[:empleado].to_i).save
      orden.update(estado_lectura_id:  2, fecha_asignacion: Time.zone.now)
      orden.save
		end
		@lector_id = Empleado.where(id: params[:empleado].to_i).first.id
		@ruta_seleccionada_id = ruta.id
		@tipo_lectura_id = OrdenLectura.find(ordenes.first).tipo_lectura_id
		respond_with @completado
  end

  # => Guarda las Desasignaciones Parciales
  def desasignacion_parcial
		@completado_uno = params[:id_boton_desasignacion].to_i
    ruta = Rutum.where(id: params[:ruta]).first
    empleado = params[:empleado]
		ordenes = params[:ordenes].split(",")
    ordenes.each do |orden_id|
			orden = OrdenLectura.find(orden_id)
      orden.asignacion.destroy
      orden.update(estado_lectura_id:1, fecha_asignacion: "")
		end
		@lector_id = Empleado.where(id: params[:empleado].to_i).first.id
		@ruta_seleccionada_id = ruta.id
		@tipo_lectura_id = OrdenLectura.find(ordenes.first).tipo_lectura_id
    respond_with @completado_uno
  end

  # => Guarda Asignaciones Completas
  def asignacion_completa
    @completado = 0
    ruta = Rutum.where(id: params[:ruta]).first
    ordenes = OrdenLectura.where(rutum_id: ruta.id,  estado_lectura_id: 1)
    ordenes.each do |o|
      Asignacion.create(orden_lectura_id: o.id, empleado_id: params[:empleado], 
                        porcion_id: ruta.porcion.id, rutum_id: ruta.id)
      o.update(estado_lectura_id: 2, fecha_asignacion: Time.zone.now)
    end
    respond_with @completado
  end

  
  def desasignacion_completa
    @completado_dos = 0
    ruta = Rutum.where(id: params[:ruta]).first
    ordenes = OrdenLectura.where(rutum_id: ruta.id, estado_lectura_id: [2,3], tipo_lectura_id: params[:tipo_lectura]).joins(:asignacion).where(asignacions: {empleado_id: params[:empleado]})
    ordenes.each do |o|
    	o.asignacion.destroy
      o.update(estado_lectura_id: 1, fecha_asignacion: "")
    end
    respond_with @completado_dos
  end

end
