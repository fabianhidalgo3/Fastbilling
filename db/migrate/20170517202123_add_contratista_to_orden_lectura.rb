class AddContratistaToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_lecturas, :contratista, foreign_key: true
  end
end
