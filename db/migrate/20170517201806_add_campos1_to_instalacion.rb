class AddCampos1ToInstalacion < ActiveRecord::Migration[5.0]
  def change
    add_column :instalacions, :codigo_sap, :integer, :limit => 8
  end
end
