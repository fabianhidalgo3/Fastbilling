class OrdenLectura < ApplicationRecord
  belongs_to :instalacion
  belongs_to :medidor
  belongs_to :cliente
  belongs_to :contratistum
  belongs_to :tipo_cliente
  belongs_to :sap
  belongs_to :rutum
  belongs_to :tipo_lectura
  belongs_to :estado_lectura
  belongs_to :tipo_tarifa
  belongs_to :porcion
  belongs_to :comuna
  belongs_to :tipo_entrega
  belongs_to :tipo_aparato
  belongs_to :tipo_establecimiento
  has_one :asignacion
  has_many :detalle_orden_lectura

  enum analisis: [:consumos, :inverosimil]

  def direccion_orden
    @direccion_orden = direccion.to_s + " " + block.to_s + " " + numero_propieda.to_s + " " + numero_departamento.to_s
  end

  def codigo
    if self[:codigo].nil?
      0
    else
      self[:codigo]
    end
  end

  def ajuste_sencillo_anterior
    if self[:ajuste_sencillo_anterior].nil?
      0
    else
      self[:ajuste_sencillo_anterior]
    end
  end

  def factor_cobro_id
    if self[:factor_cobro_id].nil?
      0
    else
      self[:factor_cobro_id]
    end
  end

  def direccion_entrega
    if self[:direccion_entrega].nil?
      ""
    else
      self[:direccion_entrega]
    end
  end

  def tipo_tarifa_id
    if self[:tipo_tarifa_id].nil?
      0
    else
      self[:tipo_tarifa_id]
    end
  end

  def tipo_entrega_id
    if self[:tipo_entrega_id].nil?
      0
    else
      self[:tipo_entrega_id]
    end
  end

  def autorizado_facturacion
    if self[:autorizado_facturacion].nil?
      false
    else
      self[:autorizado_facturacion]
    end
  end

  def facturado
    if self[:facturado].nil?
      false
    else
      self[:facturado]
    end
  end

  def fecha_propuesta
    if self[:fecha_propuesta].nil?
      Time.zone.now
    else
      self[:fecha_propuesta]
    end
  end

  def nro_municipal
    if self[:nro_municipal].nil?
      0
    else
      self[:nro_municipal]
    end
  end

end
