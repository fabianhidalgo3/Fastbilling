class Observacione < ApplicationRecord
  belongs_to :clave_lectura
  has_many :detalle_orden_lectura 
end
