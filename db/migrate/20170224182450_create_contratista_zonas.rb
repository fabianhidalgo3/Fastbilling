class CreateContratistaZonas < ActiveRecord::Migration[5.0]
  def change
    create_table :contratista_zonas do |t|
      t.references :contratista, foreign_key: true
      t.references :zona, foreign_key: true

      t.timestamps
    end
  end
end
