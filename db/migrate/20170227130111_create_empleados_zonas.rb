class CreateEmpleadosZonas < ActiveRecord::Migration[5.0]
  def change
    create_table :empleados_zonas do |t|
      t.references :empleado, foreign_key: true
      t.references :zona, foreign_key: true

      t.timestamps
    end
  end
end
