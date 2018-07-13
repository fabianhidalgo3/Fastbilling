class OrdenReparto < ApplicationRecord
  belongs_to :tipo_documento
  belongs_to :comuna
  belongs_to :cliente
  belongs_to :ruta_reparto
  belongs_to :estado_reparto
  belongs_to :tipo_reparto
  belongs_to :tipo_entrega
  belongs_to :observacion_reparto
  belongs_to :instalacion
  has_one :asignacion_reparto
end
