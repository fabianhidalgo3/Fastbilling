class CreateSaldos < ActiveRecord::Migration[5.0]
  def change
    create_table :saldos do |t|
      t.references :instalacion, foreign_key: true
      t.decimal :monto
      t.decimal :intereses

      t.timestamps
    end
  end
end
