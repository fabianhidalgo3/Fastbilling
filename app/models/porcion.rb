class Porcion < ApplicationRecord
  belongs_to :zona
  belongs_to :subempresa
  belongs_to :rutum
  has_many :asignacion
  has_many :orden_lectura


  def codigo_nombre
    if zona_id.nil?
      @codigo_nombre = codigo
    else  
      @codigo_nombre = codigo + " - " +  mes.to_s + "-" + ano.to_s
    end
  end
end
