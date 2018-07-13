class AddCampos2ToDetalleOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :detalle_orden_lecturas, :clave_lectura_anterior_2, :string
    add_column :detalle_orden_lecturas, :clave_lectura_anterior_3, :string
  end
end
