class CreateAsignacionRepartos < ActiveRecord::Migration[5.0]
  def change
    create_table :asignacion_repartos do |t|
      t.references :ruta_reparto, foreign_key: true
      t.references :porcion_reparto, foreign_key: true
      t.references :empleado, foreign_key: true
      t.references :orden_reparto, foreign_key: true

      t.timestamps
    end
  end
end
