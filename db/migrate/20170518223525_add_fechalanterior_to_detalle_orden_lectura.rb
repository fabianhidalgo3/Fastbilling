class AddFechalanteriorToDetalleOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :detalle_orden_lecturas, :fecha_lectura_anterior, :datetime
  end
end
