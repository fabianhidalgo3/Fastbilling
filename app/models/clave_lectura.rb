class ClaveLectura < ApplicationRecord
  belongs_to :tipo_cobro
  has_many	:detalle_orden_lectura
  has_many	:observacione
end
