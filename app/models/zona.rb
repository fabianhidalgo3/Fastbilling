class Zona < ApplicationRecord
  has_and_belongs_to_many :empleado
  has_and_belongs_to_many :subempresa
  has_many :asignacion
  def codigo_nombre
    if nombre.nil?
      @codigo_nombre = codigo
    else
      @codigo_nombre = nombre
    end
  end
end
