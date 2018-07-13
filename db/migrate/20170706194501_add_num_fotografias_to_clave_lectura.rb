class AddNumFotografiasToClaveLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :clave_lecturas, :num_fotografias, :integer
  end
end
