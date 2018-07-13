class AddIndiceToInstalacions < ActiveRecord::Migration[5.0]
  def change
    add_index :instalacions, :codigo
  end
end
