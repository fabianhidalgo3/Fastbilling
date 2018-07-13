class CreateIntentos < ActiveRecord::Migration[5.0]
  def change
    create_table :intentos do |t|
      t.references :detalle_orden_lectura, foreign_key: true
      t.decimal :lectura

      t.timestamps
    end
  end
end
