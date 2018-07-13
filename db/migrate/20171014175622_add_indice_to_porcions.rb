class AddIndiceToPorcions < ActiveRecord::Migration[5.0]
  def change
    add_index :porcions, :codigo
  end
end
