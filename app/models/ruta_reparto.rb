class RutaReparto < ApplicationRecord
	belongs_to :porcion_reparto
	
	def codigo_nombre
    if nombre.nil?
      @codigo_nombre = codigo
    else
      @codigo_nombre = codigo + " " + nombre
    end
  end
end
