class AddImprime2ToClaveLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :clave_lecturas, :efectivo, :boolean
    add_column :clave_lecturas, :factura, :boolean
  end
end
