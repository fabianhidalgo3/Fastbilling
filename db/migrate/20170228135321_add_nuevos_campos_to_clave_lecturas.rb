class AddNuevosCamposToClaveLecturas < ActiveRecord::Migration[5.0]
  def change
    add_column :clave_lecturas, :codigo, :string
    add_column :clave_lecturas, :descripcion_corta, :string
  end
end
