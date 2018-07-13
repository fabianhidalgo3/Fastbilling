class AddCampos1ToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :linea_orden, :integer
  end
end
