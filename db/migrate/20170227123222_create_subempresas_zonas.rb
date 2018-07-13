class CreateSubempresasZonas < ActiveRecord::Migration[5.0]
  def change
    create_table :subempresas_zonas do |t|
      t.references :zona, foreign_key: true
      t.references :subempresa, foreign_key: true

      t.timestamps
    end
  end
end
