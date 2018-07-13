class CreateInstalacions < ActiveRecord::Migration[5.0]
  def change
    create_table :instalacions do |t|
      t.string :codigo 

      t.timestamps
    end
  end
end
