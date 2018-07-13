class Cliente < ApplicationRecord
	has_many :orden_lectura

	def apellido_paterno
    if self[:apellido_paterno].nil?
      ""
    else
      self[:apellido_paterno]
    end
  end

  def apellido_materno
    if self[:apellido_materno].nil?
      ""
    else
      self[:apellido_materno]
    end
  end

  def giro
    if self[:giro].nil?
      ""
    else
      self[:giro]
    end
  end

  def telefono
    if self[:telefono].nil?
      ""
    else
      self[:telefono]
    end
  end

  def memo
    if self[:memo].nil?
      ""
    else
      self[:memo]
    end
  end

  def duenorespo
    if self[:duenorespo].nil?
      ""
    else
      self[:duenorespo]
    end
  end

end
