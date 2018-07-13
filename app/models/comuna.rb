class Comuna < ApplicationRecord
	belongs_to :provincium
	has_many :orden_lectura
	has_and_belongs_to_many :factor_cobro
	def codigo_nombre
    if nombre.nil?
      @codigo_nombre = codigo
    else
      @codigo_nombre = codigo + " - " + nombre 
    end
  end
end
