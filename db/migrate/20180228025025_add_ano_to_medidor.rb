class AddAnoToMedidor < ActiveRecord::Migration[5.0]
  def change
    add_column :medidors, :ano, :integer
  end
end
