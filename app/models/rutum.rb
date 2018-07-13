class Rutum < ApplicationRecord
  belongs_to :porcion
  has_many :orden_lectura

  def codigo_nombre
    if nombre.nil?
      @codigo_nombre = codigo
    else
      @codigo_nombre = codigo + " - " +  mes.to_s + "-" + ano.to_s
    end
  end

  def nombre
    if self[:nombre].nil?
      ""
    else
      self[:nombre]
    end
  end

end
