class LecturaDictadaClienteController < ApplicationController
respond_to :js, :json, :html

def index

end

def form_lectura_dictada
  @cliente = Cliente.where(numero_cliente: params[:cliente]).take
  @ordenLectura = OrdenLectura.joins(:cliente).where(clientes: {numero_cliente: params[:cliente]}).take
end

def tabla_contenido
  @cliente = Cliente.where(numero_cliente: params[:cliente]).take
  p @cliente
  @ordenLectura = OrdenLectura.joins(:cliente).where(clientes: {numero_cliente: params[:cliente]}).take
  p @ordenLectura
  @listaOrdenes = Array.new
  ordenesLectura = OrdenLectura.joins(:cliente).where(clientes: {numero_cliente: params[:cliente]})
  ordenesLectura.each do |orden|
    fila = Array.new
    fila.push(orden.id)
    fila.push(orden.comuna.nombre.upcase)
    fila.push(orden.tipo_lectura.nombre)
    fila.push(orden.rutum.porcion.mes.to_s + "/" + orden.rutum.porcion.ano.to_s)
    if !orden.fecha_asignacion.blank?  
      fila.push(orden.fecha_asignacion.strftime("%d/%m/%Y %H:%M:%S").to_s)
    else 
      fila.push("")
    end 
    if !orden.detalle_orden_lectura.take.nil?
      if !orden.detalle_orden_lectura.take.fecha_ejecucion.blank?  
        fila.push(orden.detalle_orden_lectura.take.fecha_ejecucion.strftime("%d/%m/%Y %H:%M:%S").to_s)
      else 
        fila.push("No registra")
      end 
    end
    if !orden.asignacion.nil?  
      fila.push(orden.asignacion.empleado.nombre_completo.upcase)
    else
      fila.push("No registra")
    end
    fila.push(orden.estado_lectura.nombre)
    if !orden.detalle_orden_lectura.first.clave_lectura.nil?
      fila.push(orden.detalle_orden_lectura.first.clave_lectura.nombre)
    else 
      fila.push("No registra")
    end    
    if !orden.detalle_orden_lectura.take.nil?
      claveAnterior = orden.detalle_orden_lectura.first.clave_lectura_anterior
      fila.push(claveAnterior)
    else
      fila.push("No registra")
    end
    fila.push(orden.detalle_orden_lectura.first.lectura_actual)
    fila.push(orden.lectura_dictada)    

    @listaOrdenes.push(fila)
  end
  respond_with @listaOrdenes
end


def agregar_lectura_dictada
  ordenLectura = OrdenLectura.find(params[:orden_id])
  usuario = current_usuario
  if !ordenLectura.nil?
    @completado = Array.new
    if ordenLectura.asignacion.nil?
      asigacion = Asignacion.create(orden_lectura_id: ordenLectura.id, empleado_id: usuario.id,porcion_id: ordenLectura.rutum.porcion.id, rutum_id: ordenLectura.rutum_id)
      asigacion.orden_lectura.update(estado_lectura_id:4, fecha_asignacion: Time.now)
      asigacion.orden_lectura.update(lectura_dictada: params[:lectura_dictada])
      asigacion.orden_lectura.detalle_orden_lectura.update(clave_lectura_id:3, fecha_ejecucion: Time.now)
      @completado.push("Asignacion Creada Correctamente",params[:lectura_dictada])
    else 
      ordenLectura.update(estado_lectura_id:4, fecha_asignacion: Time.now)
      ordenLectura.asignacion.update(empleado_id: usuario.id)
      ordenLectura.update(lectura_dictada: params[:lectura_dictada])
      ordenLectura.detalle_orden_lectura.update(clave_lectura_id:3, fecha_ejecucion: Time.now)
      @completado.push("Asignacion Actualizada Correctamente",params[:lectura_dictada])
    end
  end
  render 'alertas'
end

end
