class CreateZonas < ActiveRecord::Migration[5.0]
  def change
    create_table :zonas do |t|
      t.string :codigo
      t.string :nombre

      t.timestamps
    end
  end
end
