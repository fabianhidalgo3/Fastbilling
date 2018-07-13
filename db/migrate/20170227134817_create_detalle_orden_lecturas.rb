class CreateDetalleOrdenLecturas < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_orden_lecturas do |t|
      t.references :orden_lectura, foreign_key: true
      t.references :numerador, foreign_key: true
      t.decimal :lectura_anterior
      t.decimal :lectura_promedio
      t.decimal :lectura_actual
      t.decimal :rango_superior
      t.decimal :rango_inferior
      t.datetime :fecha_ejecucion
      t.references :clave_lectura, foreign_key: true
      t.references :observacione, foreign_key: true
      t.timestamps
    end
  end
end
