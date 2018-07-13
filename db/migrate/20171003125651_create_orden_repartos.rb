class CreateOrdenRepartos < ActiveRecord::Migration[5.0]
  def change
    create_table :orden_repartos do |t|
      t.integer :numero_interno, limit: 8
      t.integer :numero_boleta, limit: 8
      t.references :tipo_documento, foreign_key: true
      t.date :fecha_emision
      t.date :fecha_vencimiento
      t.datetime :fecha_entrega
      t.integer :total_pago
      t.integer :orden_ruta
      t.integer :correlativo_impresion
      t.string :direccion_entrega
      t.references :comuna, foreign_key: true
      t.references :cliente, foreign_key: true
      t.references :ruta_reparto, foreign_key: true
      t.references :estado_reparto, foreign_key: true
      t.references :tipo_reparto, foreign_key: true
      t.references :tipo_entrega, foreign_key: true
      t.references :observacion_reparto, foreign_key: true

      t.timestamps
    end
    add_index :orden_repartos, :numero_interno
    add_index :orden_repartos, :numero_boleta
  end
end
