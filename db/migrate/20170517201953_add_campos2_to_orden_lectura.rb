class AddCampos2ToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_lecturas, :tipo_cliente, foreign_key: true
  end
end
