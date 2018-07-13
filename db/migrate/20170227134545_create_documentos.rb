class CreateDocumentos < ActiveRecord::Migration[5.0]
  def change
    create_table :documentos do |t|
      t.integer :numero_documento
      t.decimal :monto_total
      t.references :tipo_documento, foreign_key: true
      t.references :orden_lectura, foreign_key: true

      t.timestamps
    end
  end
end
