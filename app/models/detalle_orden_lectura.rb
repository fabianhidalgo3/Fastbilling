class DetalleOrdenLectura < ApplicationRecord
  belongs_to :orden_lectura
  belongs_to :numerador
  belongs_to :clave_lectura
  has_many :fotografium
  belongs_to :observacione
  has_many :intento

  def m3_acumulados
    if self[:m3_acumulados].nil?
      0
    else
      self[:m3_acumulados]
    end
  end

  def rango_inferior
    if self[:rango_inferior].nil?
      0.0
    else
      self[:rango_inferior]
    end
  end

  def rango_superior
    if self[:rango_superior].nil?
      0.0
    else
      self[:rango_superior]
    end
  end

  def lectura_promedio
    if self[:lectura_promedio].nil?
      0.0
    else
      self[:lectura_promedio]
    end
  end

  def clave_lectura_anterior_2
    if self[:clave_lectura_anterior_2].nil?
      0
    else
      self[:clave_lectura_anterior_2]
    end
  end

  def clave_lectura_anterior_3
    if self[:clave_lectura_anterior_3].nil?
      0
    else
      self[:clave_lectura_anterior_3]
    end
  end

end
