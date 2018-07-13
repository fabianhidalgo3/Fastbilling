class CreateDescuentos < ActiveRecord::Migration[5.0]
  def change
    create_table :descuentos do |t|
      t.string :descripcion
      t.decimal :monto
      t.references :instalacion, foreign_key: true

      t.timestamps
    end
  end
end
