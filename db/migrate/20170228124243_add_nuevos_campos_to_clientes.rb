class AddNuevosCamposToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :telefono, :string
    add_column :clientes, :memo, :string
    add_column :clientes, :duenorespo, :string
  end
end
