class CreateObservaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :observaciones do |t|
      t.string :descripcion
      t.references :clave_lectura, foreign_key: true

      t.timestamps
    end
  end
end
