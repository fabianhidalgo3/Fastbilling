class CreateAsignacions < ActiveRecord::Migration[5.0]
  def change
    create_table :asignacions do |t|
      t.references :rutum, foreign_key: true
      t.references :porcion, foreign_key: true
      t.references :orden_lectura, foreign_key: true
      t.references :empleado, foreign_key: true

      t.timestamps
    end
  end
end
