class Documento < ApplicationRecord
  belongs_to :tipo_documento
  belongs_to :orden_lectura
end
