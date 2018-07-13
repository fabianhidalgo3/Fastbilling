class PorcionReparto < ApplicationRecord
  belongs_to :zona
  belongs_to :subempresa
  def codigo_nombre
    if zona_id.nil?
      @codigo_nombre = codigo
    else
      @codigo_nombre = codigo + " - " +  mes.to_s + "-" + ano.to_s
    end
  end
  # def codigo_nombre

  #   if codigo.length < 2
  #   	codigoRuta = "0" + codigo
  #   else
  #     codigoRuta = codigo
  #   end

  #   if zona_id.nil?
  #     @codigo_nombre = codigoRuta
  #   else
  #     @codigo_nombre = codigoRuta + "-"  + mes.to_s + "/" + ano.to_s
  #   end
  # end
end
