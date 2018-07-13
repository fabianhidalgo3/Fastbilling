class AddNuevosCamposToDetalleOrdenLecturas < ActiveRecord::Migration[5.0]
  def change
    add_column :detalle_orden_lecturas, :clave_lectura_anterior, :string
    add_column :detalle_orden_lecturas, :m3_acumulados, :decimal
  end
end
