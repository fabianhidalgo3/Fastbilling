class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.integer :numero_cliente
      t.string :rut
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :direccion
      t.string :giro

      t.timestamps
    end
  end
end
