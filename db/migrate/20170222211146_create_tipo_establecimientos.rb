class CreateTipoEstablecimientos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_establecimientos do |t|
      t.string :codigo
      t.string :nombre
      t.boolean :facturacion_en_terreno
      t.boolean :excento

      t.timestamps
    end
  end
end
