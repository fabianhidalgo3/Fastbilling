class CreateEmpresaZonas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresa_zonas do |t|
      t.references :empresa, foreign_key: true
      t.references :zona, foreign_key: true

      t.timestamps
    end
  end
end
