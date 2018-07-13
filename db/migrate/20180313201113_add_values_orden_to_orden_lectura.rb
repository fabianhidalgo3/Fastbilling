class AddValuesOrdenToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_lecturas, :proceso_lecturas, foreign_key: true
    add_column :orden_lecturas, :id_gasco, :string
  end
end
