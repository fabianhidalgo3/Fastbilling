class AddValuesLecuraDictadaToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :lectura_dictada, :string
    add_column :orden_lecturas, :foto_lectura_dictada, :string
  end
end
