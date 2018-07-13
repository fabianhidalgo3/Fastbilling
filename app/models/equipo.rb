class Equipo < ApplicationRecord
  belongs_to :modelo
  belongs_to :empleado

	validates :mac, uniqueness: {message: "Equipo ya registrado."}
end
