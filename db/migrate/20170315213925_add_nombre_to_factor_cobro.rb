class AddNombreToFactorCobro < ActiveRecord::Migration[5.0]
  def change
    add_column :factor_cobros, :nombre, :string
  end
end
