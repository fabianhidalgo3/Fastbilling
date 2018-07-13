class Asignacion < ApplicationRecord
  belongs_to :rutum
  belongs_to :porcion
  belongs_to :orden_lectura
  belongs_to :empleado
  belongs_to :zona
end
 