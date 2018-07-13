class CreateTipoTarifas < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_tarifas do |t|
      t.string :nombre
      t.boolean :facturacion_en_terreno

      t.timestamps
    end
  end
end
