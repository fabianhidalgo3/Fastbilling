class AddDatosValidacionToObservacione < ActiveRecord::Migration[5.0]
  def change
    add_column :observaciones, :num_fotografias, :integer
    add_column :observaciones, :requerido, :boolean
    add_column :observaciones, :efectivo, :boolean
    add_column :observaciones, :factura, :boolean
  end
end
