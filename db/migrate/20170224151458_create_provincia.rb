class CreateProvincia < ActiveRecord::Migration[5.0]
  def change
    create_table :provincia do |t|
      t.string :codigo
      t.string :nombre
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
