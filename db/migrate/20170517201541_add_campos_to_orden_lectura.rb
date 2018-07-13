class AddCamposToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :calle, :string
    add_column :orden_lecturas, :block, :string
    add_column :orden_lecturas, :numero_propieda, :string
    add_column :orden_lecturas, :numero_departamento, :string
    add_column :orden_lecturas, :adicional_direccion, :string
    add_column :orden_lecturas, :objeto_conex, :string
  end
end
