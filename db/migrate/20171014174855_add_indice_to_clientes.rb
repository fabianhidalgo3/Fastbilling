class AddIndiceToClientes < ActiveRecord::Migration[5.0]
  def change
    add_index :clientes, :numero_cliente
  end
end
