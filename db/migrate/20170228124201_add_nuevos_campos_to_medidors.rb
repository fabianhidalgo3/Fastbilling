class AddNuevosCamposToMedidors < ActiveRecord::Migration[5.0]
  def change
    add_column :medidors, :nro_digitos, :integer
    add_column :medidors, :diametro, :integer
  end
end
