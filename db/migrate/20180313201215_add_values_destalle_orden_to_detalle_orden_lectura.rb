class AddValuesDestalleOrdenToDetalleOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :detalle_orden_lecturas, :id_gasco, :string
    add_column :detalle_orden_lecturas, :detalle_id_gasco, :string

  end
end
