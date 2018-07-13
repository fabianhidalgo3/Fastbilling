class CreateDetalleDocumentos < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_documentos do |t|
      t.string :detalle
      t.decimal :monto
      t.references :documento, foreign_key: true

      t.timestamps
    end
  end
end
