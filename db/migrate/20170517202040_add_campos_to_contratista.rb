class AddCamposToContratista < ActiveRecord::Migration[5.0]
  def change
    add_column :contratista, :codigo, :string
  end
end
