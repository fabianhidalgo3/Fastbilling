class AddCamposToDetalleOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :detalle_orden_lecturas, :numero_digitos_numerador, :integer
  end
end
