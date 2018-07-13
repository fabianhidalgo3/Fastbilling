class CreateRutaRepartos < ActiveRecord::Migration[5.0]
  def change
    create_table :ruta_repartos do |t|
      t.string :codigo
      t.string :nombre
      t.references :porcion_reparto, foreign_key: true

      t.timestamps
    end
  end
end
