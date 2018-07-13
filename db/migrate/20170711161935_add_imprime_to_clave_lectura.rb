class AddImprimeToClaveLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :clave_lecturas, :requerido, :boolean
  end
end
