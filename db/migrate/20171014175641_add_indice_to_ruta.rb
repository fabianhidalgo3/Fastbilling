class AddIndiceToRuta < ActiveRecord::Migration[5.0]
  def change
    add_index :ruta, :codigo
  end
end
