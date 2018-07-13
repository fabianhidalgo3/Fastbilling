class CreateEquipos < ActiveRecord::Migration[5.0]
  def change
    create_table :equipos do |t|
      t.string :nombre
      t.string :mac
      t.references :modelo, foreign_key: true
      t.references :empleado, foreign_key: true

      t.timestamps
    end
  end
end
