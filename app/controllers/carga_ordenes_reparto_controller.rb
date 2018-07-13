class CargaOrdenesRepartoController < ApplicationController
  def index

  end

  def show

  end

  def import
    row = Array.new
		file = params[:file]

    require 'csv'

    mes = params[:date]['mes']
    ano = params[:date]['año']
    #Agregar Fecha Esperada..

    #Inicia un hilo de ejecucion
    Thread.new do
      #Se recorre cada linea del archivo CSV
      CSV.foreach(file.path, :headers => true) do |row|
       
       	# Se Define la SubEmpresa Como Metrogas
        subempresa = 1 #Por ahora se dejara fija
        zona = 1 #Por Ahora se dejara fija
       
        if row[18].nil? # Se Valida la calle 
        	calle = ""
      	else
      		calle = row[18].strip
      	end
      	# > Se valida numero de casa
      	if row[19].nil? 
        	numero = ""
      	else
      		numero = row[19].strip
      	end
      	# > Se valida block
      	if row[20].nil?
        	block = ""
      	else
      		block = row[20].strip
      	end
      	# > Se valida obs.. adicional
      	if row[21].nil? 
        	adicional = ""
      	else
      		adicional = row[21].strip
      	end
      	# Creo Direccion Completa
        direccion = calle + " " + numero + " " +  block + " " +  adicional
        
        porcion = PorcionReparto.where(codigo: row[15]).take
        if porcion.nil?
          porcion = PorcionReparto.create(codigo: row[15], ano: ano, mes: mes, zona_id: zona, subempresa_id: subempresa)
        end
				p porcion
        
        ruta = RutaReparto.where(codigo: row[16]).take
        if ruta.nil?
          ruta = RutaReparto.create(codigo: row[16], porcion_reparto_id: porcion.id)
        end
        p ruta

        if row[6].nil?
        	primerNombre = ""
        else
        	primerNombre = row[6]
        end
         if row[7].nil?
        	segundoNombre = ""
        else
        	segundoNombre = row[7]
        end

        cliente = Cliente.where(numero_cliente: row[2]).take
        if cliente.nil? then
          cliente = Cliente.create(numero_cliente: row[2], nombre: primerNombre + " " + segundoNombre,
           			direccion: direccion) #Faltan datos de cliente
        end
        p cliente

        instalacion = Instalacion.where(codigo: row[2]).take
        if instalacion.nil? then
          instalacion = Instalacion.create(codigo: row[2])
        end
        p instalacion

        comuna = Comuna.where(nombre: row[22].capitalize).take
        if comuna.nil?
          comuna = Comuna.create(nombre: row[22], zona_id: zona)
          p "Comuna Creada : " + comuna.nombre.to_s
        end

        tipoEntrega = 1 #Tipo Entrega Normal
        tipoDocumento = 3 #Boleta Electronica
        ordenReparto = OrdenReparto.where(numero_interno: row[3]).take
        fechaEmision = row[1].gsub(/[.]/, '/')
        fechaVencimiento = row[14].gsub(/[.]/, '/')
        estadoReparto = 1 # Reparto Sin Asignar
        tipoReparto = 1 #Reparto Normal

        p fechaVencimiento
        p fechaEmision
        if ordenReparto.nil?
        	ordenReparto = OrdenReparto.create(
             numero_interno: row[3], numero_boleta: row[12],
             tipo_documento_id: tipoDocumento, instalacion_id: instalacion.id,
             fecha_emision: Date.strptime(fechaEmision, '%d/%m/%y'),
             fecha_vencimiento: Date.strptime(fechaVencimiento, '%d/%m/%y'),
             total_pago: 0, # Falta Información Total pago
             direccion_entrega: direccion, #Dirección
             comuna_id: comuna.id,
             correlativo_impresion:row[0],
             orden_ruta:row[17],
             cliente_id: cliente.id, ruta_reparto_id: ruta.id,
             tipo_entrega_id: tipoEntrega, tipo_reparto_id: tipoReparto,
             estado_reparto_id: estadoReparto, :fecha_carga => Time.zone.now) #Despues hay que buscar la comuna

         end
      end
    end
  end
end
