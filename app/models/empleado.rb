class Empleado < ApplicationRecord
  belongs_to :contratistum
  belongs_to :subempresa
  has_many  :orden_lectura
  belongs_to  :tipo_tarifa
  belongs_to  :sector
  belongs_to  :tipo_sector
	has_many :asignacion
	has_many :asignacion_reparto
  has_and_belongs_to_many :zona
  has_one :equipo
	belongs_to :usuario

	validates :rut, uniqueness: { message: "Rut ya registrado."}

  def nombre_completo
    @nombre_completo = nombre + " " + apellido_paterno + " " + apellido_materno
  end
end
