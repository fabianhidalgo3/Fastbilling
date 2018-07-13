class Medidor < ApplicationRecord
  belongs_to :modelo

  def propiedad_cliente
    if self[:propiedad_cliente].nil?
      false
    else
      self[:propiedad_cliente]
    end
  end

  def diametro
    if self[:diametro].nil?
      0
    else
      self[:diametro]
    end
  end
  
  def nro_digitos
    if self[:nro_digitos].nil?
      0
    else
      self[:nro_digitos]
    end
  end
end
