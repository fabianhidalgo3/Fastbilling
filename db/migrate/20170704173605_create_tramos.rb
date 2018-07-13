class CreateTramos < ActiveRecord::Migration[5.0]
  def change
    create_table :tramos do |t|
      t.string :nombre
      t.integer :desde
      t.integer :hasta
      t.integer :precio
      t.references :tipo_tramo, foreign_key: true
      t.references :factor_cobro, foreign_key: true

      t.timestamps
    end
  end
end
