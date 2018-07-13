class CreateSubempresas < ActiveRecord::Migration[5.0]
  def change
    create_table :subempresas do |t|
      t.string :rut
      t.string :razon_social
      t.string :giro
      t.string :direccion
      t.references :comuna, foreign_key: true
      t.string :imagen

      t.timestamps
    end
  end
end
