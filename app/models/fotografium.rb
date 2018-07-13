class Fotografium < ApplicationRecord
  belongs_to :detalle_orden_lectura
  belongs_to :evaluacion
  belongs_to :clave_fotografium
  validates :archivo, uniqueness: true
end
