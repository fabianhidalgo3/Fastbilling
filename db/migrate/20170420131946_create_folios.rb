class CreateFolios < ActiveRecord::Migration[5.0]
  def change
    create_table :folios do |t|
      t.integer :numero_folio
      t.integer :codigo_autorizacion
      t.references :estado_facturacion, foreign_key: true

      t.timestamps
    end
  end
end
