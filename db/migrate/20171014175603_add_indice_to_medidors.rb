class AddIndiceToMedidors < ActiveRecord::Migration[5.0]
  def change
    add_index :medidors, :numero_medidor
  end
end
