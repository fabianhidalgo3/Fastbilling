class CreateSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :sectors do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
