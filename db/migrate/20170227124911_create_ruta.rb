class CreateRuta < ActiveRecord::Migration[5.0]
  def change
    create_table :ruta do |t|
      t.string :codigo
      t.string :nombre
      t.references :porcion, foreign_key: true

      t.timestamps
    end
  end
end
