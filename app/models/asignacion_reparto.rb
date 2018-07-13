class AsignacionReparto < ApplicationRecord
  belongs_to :ruta_reparto
  belongs_to :porcion_reparto
  belongs_to :empleado
  belongs_to :orden_reparto
end
