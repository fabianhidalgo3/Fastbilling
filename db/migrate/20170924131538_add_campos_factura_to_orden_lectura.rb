class AddCamposFacturaToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :autorizado_facturacion, :boolean
    add_column :orden_lecturas, :facturado, :boolean
  end
end
