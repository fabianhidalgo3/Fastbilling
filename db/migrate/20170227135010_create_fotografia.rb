class CreateFotografia < ActiveRecord::Migration[5.0]
  def change
    create_table :fotografia do |t|
      t.references :detalle_orden_lectura, foreign_key: true
      t.string :archivo
      t.string :descripcion
      t.timestamps
    end
  end
end
