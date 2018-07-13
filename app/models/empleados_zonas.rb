class EmpleadosZonas < ApplicationRecord
  belongs_to :empleado
  belongs_to :zona
end
