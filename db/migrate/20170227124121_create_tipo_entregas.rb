class CreateTipoEntregas < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_entregas do |t|
      t.string :codigo
      t.string :nombre
      t.boolean :facturacion_en_terreno

      t.timestamps
    end
  end
end
