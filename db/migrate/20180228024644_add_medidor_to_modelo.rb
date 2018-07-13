class AddMedidorToModelo < ActiveRecord::Migration[5.0]
  def change
    add_column :modelos, :medidor, :boolean
  end
end
