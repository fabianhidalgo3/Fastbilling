class CreateComunas < ActiveRecord::Migration[5.0]
  def change
    create_table :comunas do |t|
      t.string :codigo
      t.string :codigo_sii
      t.string :codigo_tesoreria
      t.string :nombre
      t.references :provincium, foreign_key: true
      t.references :zona, foreign_key: true

      t.timestamps
    end
  end
end
