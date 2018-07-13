class CargaordenesController < ApplicationController

  def index 
    # Usuario Loggeado
    user = current_usuario 
    # Zonas del Usuario
    @zonas = user.empleado.zona 
  end

  # > Importar Ordenes de Lectura XML
  def import_xml
    file = params[:file]
    mes = params[:date]['mes']
    ano = params[:date]['año']
    calle = ""
    numero = ""
    block = ""
    departamento = ""
    direccionAdicional = ""
    direccion = ""
    rangoSuperior = 0
    @doc = Nokogiri::XML(File.open(file.path))
    Thread.new do
      @doc.xpath("//E1RDI_BODY//E1RDID").each do |datos|
        nombre = datos.xpath("SYMNAME").inner_text
        codigo = datos.xpath("SYMVALUE").inner_text
        zona = Zona.where(id: params[:Zona]).first
        # > Tag Código Orden Lectura
        if nombre =="WA_READING-ABLBELNR"
          @orden = OrdenLectura.where(:codigo => codigo.to_i).first
          if @orden.nil?
            @orden = OrdenLectura.create(:codigo => codigo.to_i)
          end
        end
        # Tag Fecha Propuesta
        if nombre =="WA_GENERAL-ADATSOLL"
          @orden.update(:fecha_propuesta => codigo)
        # Tag Porcion
        elsif nombre =="WA_MR_UNIT-PORTION"
          @porcion = Porcion.where(codigo:  codigo, ano:  ano, mes: mes).first
          if @porcion.nil?
            @porcion = Porcion.create(:codigo => codigo, :ano => ano,:mes => mes, :zona_id => 1, :subempresa_id => 1, :abierto => true, :zona_id => zona.id)
            @porcion.save
          end
        # Tag Cuidad
        elsif nombre == "WA_CO_ADDRESS-CITY1"
          @ciudad = Ciudad.where(nombre: codigo.capitalize).first
          if @ciudad.nil?
            @ciudad = Ciudad.create(:nombre => codigo.capitalize)
            @orden.update(:ciudad_id => @ciudad.id)
          else
             @orden.update(:ciudad_id => @ciudad.id)
          end
        # > Tag Comuna
        elsif nombre == "WA_CO_ADDRESS-CITY2"
          comuna = Comuna.where(nombre: codigo).first
          if comuna.nil?
            comuna = Comuna.create(:nombre => codigo)
            @ciudad.update(:comuna_id => comuna.id    )
            @ciudad.save
            @orden.update(:comuna_id => comuna.id)
          end
          @orden.update(:comuna_id => comuna.id)
        # > Tag Ruta
        elsif nombre =="WA_MR_UNIT-TERMSCHL"
          ruta = Rutum.where(codigo: codigo, ano: ano, mes: mes).first
          if ruta.nil?
            ruta = Rutum.create(:codigo => codigo, :porcion_id => @porcion.id, :ano => ano, :mes => mes, :abierto => true)
            ruta.save
            @orden.update(:rutum_id => ruta.id)
          end
          @orden.update(:rutum_id => ruta.id)

        # > Tag Secuencia Ruta  
        elsif nombre =="WA_ADICIONAL-SECUENCIA_RUTA"
          @orden.update(:posicion => codigo, :secuencia_lector => codigo)
        end
        # > Tag Medidor
        if nombre =="WA_DEVICE-GERAET"
          @medidor = Medidor.where(numero_medidor: codigo).first
          if @medidor.nil?
            @medidor = Medidor.create(:numero_medidor => codigo, modelo_id: 1)
            @orden.update(:medidor_id => @medidor.id)
          else
            @orden.update(:medidor_id => @medidor.id)
          end
        # > Tag Instalación  
        elsif nombre == "WA_BUS_PART-PARTNER"
          @instalacion = Instalacion.where(codigo: codigo).first
          if @instalacion.nil?
            @instalacion = Instalacion.create(:codigo => codigo)
            @orden.update(:instalacion_id => @instalacion.id)
            @instalacion.save
          end
          @orden.update(:instalacion_id => @instalacion.id)
        # > Tag Calle
        elsif nombre == "WA_CO_ADDRESS-STREET"
          calle = codigo
          @orden.update(:calle => codigo)
        # > Tag Block
        elsif nombre == "WA_ADICIONAL-BLOCK"
          block = codigo
          @orden.update(:block => codigo)
        # > Tag Número Propiedad
        elsif nombre == "WA_CO_ADDRESS-HOUSE_NUM1"
          numero = codigo
          @orden.update(:numero_propieda => codigo)
        # > Tag Numero Departamento
        elsif nombre =="WA_ADICIONAL-HOUSE_NUM2"
          departamento = codigo
        @orden.update(:numero_departamento => codigo)          
        # > Tag Direccion Adicional
        elsif nombre =="WA_ADICIONAL-HOUSE_NUM2_PTOSUM"
          direccionAdicional = codigo
          direccion = calle + " " + numero + " " + block + " " + departamento + " " + direccionAdicional
          @orden.update(:direccion_entrega => direccion, :direccion => direccion, :adicional_direccion => direccionAdicional)
        # > Tag numbre Cliente
        elsif nombre =="WA_ADICIONAL-NAME1"
          @cliente = Cliente.where(numero_cliente: @instalacion.codigo).first
          if @cliente.nil?
            @cliente = Cliente.create(:nombre => codigo, :direccion => direccion, :numero_cliente => @instalacion.codigo )
            @orden.update(:cliente_id => @cliente.id)
          end
          @orden.update(:cliente_id => @cliente.id)
        # > Tag Numero Telefono
        elsif nombre =="WA_BUS_PART-TEL_NUMBER"
          @cliente.update(:telefono => codigo)
        # > Tag Numerador 
        elsif nombre =="WA_REGISTER-ZWNUMMER"
          numerador = Numerador.where(codigo: codigo).first
          if numerador.nil?
            numerador = Numerador.create(:codigo => codigo)
            numerador.save
          end
          @detalle = DetalleOrdenLectura.create(:orden_lectura_id => @orden.id, :numerador_id => numerador.id)

        elsif nombre =="WA_READING-STANZVOR"
          @detalle.update(:numero_digitos_numerador => codigo.to_i)

        elsif nombre =="WA_ADICIONAL-LINEA"
          @orden.update(:linea_orden => codigo)

        elsif nombre =="WA_INSTALL-ANLAGE"
          @instalacion.update(:codigo_sap => codigo)
        # > Tipo Aparato
        elsif nombre == "WA_ADICIONAL-TIPO_APARATO"
          tipoAparato = TipoAparato.where(codigo: codigo).first
          if tipoAparato.nil?
            tipoAparato = TipoAparato.create(:codigo => codigo)
          end
          @orden.update(:tipo_aparato_id => tipoAparato.id)
        # > Tipo Cliente
        elsif nombre =="WA_ADICIONAL-TIPO_CLIENTE"
          tcliente = TipoCliente.where(nombre: codigo).first
          if tcliente.nil?
            tcliente = TipoCliente.create(:nombre => codigo)
            @orden.update(:tipo_cliente_id => tcliente.id)
          end
          @orden.update(:tipo_cliente_id => tcliente.id)

        elsif nombre =="WA_RANGES-LOWER_RESULT1"
          @detalle.update(:rango_inferior => codigo)
          rangoSuperior = codigo.to_i + 30
        elsif nombre =="WA_RANGES-UPPER_RESULT1"
          @detalle.update(:rango_superior => rangoSuperior)
          
        elsif nombre =="WA_ADICIONAL-NOTA_LEC_ANT"
          @detalle.update(:clave_lectura_anterior => codigo)

        elsif nombre =="WA_PREREAD1-E_ZWSTAND"
          @detalle.update(:lectura_anterior => codigo)

        elsif nombre =="WA_PREREAD1-ADAT"
          @fecha = codigo

        elsif nombre =="WA_PREREAD1-ATIM"
          f = @fecha + ":" + codigo
          @detalle.update(:fecha_lectura_anterior => f)

        elsif nombre =="WA_ADICIONAL-STORTZUS"
          @orden.update(:observacion => codigo)

        elsif nombre =="WA_ADICIONAL-TIPO_ARCH"
          tipolectura = TipoLectura.where(id: codigo).first
          if tipolectura.nil?
            tipolectura = TipoLectura.create(:id => codigo)
            @orden.update(:tipo_lectura_id => tipolectura.id)
            tipolectura.save
          end
          @orden.update(:tipo_lectura_id => tipolectura.id)

        # ------      Modificar Consulta cuando carga este completa     ---------#
        elsif nombre == "WA_READING-ABLESER"
          contratista = Contratistum.where(id: 1).first
          if contratista.nil?
            contratista = Contratistum.create(:id => codigo)
            @orden.update(:contratista_id => contratista.id)
            contratista.save
          end
          @orden.update(:contratista_id => contratista.id)

        elsif nombre == "WA_ADICIONAL-MODELO_MED"
          if codigo != "."
            modelo = Modelo.where(id: codigo).first
            if modelo.nil?
              modelo = Modelo.create(:id => codigo)
              @medidor.update(:modelo_id => modelo.id)
              modelo.save
            end
            @medidor.update(:modelo_id => modelo.id)
          end

        elsif nombre =="WA_ADICIONAL-NOTA_LEC_ANT2"
          @detalle.update(:clave_lectura_anterior_2 => codigo)

        elsif nombre =="WA_ADICIONAL-NOTA_LEC_ANT3"
          @detalle.update(:clave_lectura_anterior_3 => codigo)

        elsif nombre =="WA_ADICIONAL-MESES_SINLECTURA"
          @orden.update(:meses_sin_lectura => codigo)

        elsif nombre =="WA_ADICIONAL-STATUSCORTE"
          @orden.update(:estado_corte => codigo)

        elsif nombre =="WA_ADICIONAL-TIPOLECTURA"
          #


        elsif nombre =="WA_CONN_OBJ-HAUS"
          #

        elsif nombre =="WA_ADICIONAL-LECT_OBLIGADA"
          @orden.update(:lectura_obligada => codigo)

        elsif nombre =="WA_ADICIONAL-VBSART"
          if codigo != "."
            tipoEstablecimiento = TipoEstablecimiento.where(codigo: codigo).first
            if tipoEstablecimiento.nil?
              tipoEstablecimiento = TipoEstablecimiento.create(:codigo => codigo)
              @orden.update(:tipo_establecimiento_id => tipoEstablecimiento.id)
              tipoEstablecimiento.save
            end
            @orden.update(:tipo_establecimiento_id => tipoEstablecimiento.id)
          end

        elsif nombre =="WA_ADICIONAL-SECREL"
          @orden.update(:secuencia_lector => codigo)

        elsif nombre =="WA_INSTALL-TARIFTYP"
          #

        elsif nombre =="WA_ADICIONAL-MESES_SINCONSUMO"
          @orden.update(:meses_sin_consumo => codigo)

        elsif nombre =="WA_ADICIONAL-FLAG_CORTE"
          @orden.update(:flag_corte_suministro => codigo, 
            :estado_lectura_id => 1, :fecha_carga => Time.zone.now, :relectura => false )
          @orden.save

        elsif nombre =="WA_DE_NOTE1-NOTE"
          #

        elsif nombre =="WA_DE_NOTE1-NOTE_RESOLVE"
          #

        elsif nombre =="WA_ADICIONAL-HIST_CC"
          #

        elsif nombre =="WA_ADICIONAL-CAMPANA1"
          #

        elsif nombre =="WA_ADICIONAL-CAMPANA2"
          #

        elsif nombre =="WA_ADICIONAL-CAMPANA3"
          #

        elsif nombre =="WA_ADICIONAL-CAMPANA4"
          #
        end
      end
    end
  end
end
