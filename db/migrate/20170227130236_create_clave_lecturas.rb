class CreateClaveLecturas < ActiveRecord::Migration[5.0]
  def change
    create_table :clave_lecturas do |t|
      t.string :nombre
      t.references :tipo_cobro, foreign_key: true

      t.timestamps
    end
  end
end
