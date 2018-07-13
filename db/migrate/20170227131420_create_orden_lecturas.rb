class CreateOrdenLecturas < ActiveRecord::Migration[5.0]
  def change
    create_table :orden_lecturas do |t|
      t.integer :codigo, :limit => 8
      t.integer :posicion
      t.string :direccion
      t.string :direccion_entrega
      t.string :numero_poste
      t.datetime :fecha_carga
      t.datetime :fecha_propuesta
      t.datetime :fecha_asignacion
      t.decimal :gps_latitud, :precision => 10, :scale => 7
      t.decimal :gps_longitud, :precision => 10, :scale => 7
      t.decimal :ajuste_sencillo_anterior, :precision => 6, :scale => 2
      t.decimal :ajuste_sencillo_actual, :precision => 6, :scale => 2
      t.references :instalacion, foreign_key: true
      t.references :medidor, foreign_key: true
      t.references :cliente, foreign_key: true
      t.references :rutum, foreign_key: true
      t.references :tipo_lectura, foreign_key: true
      t.references :estado_lectura, foreign_key: true
      t.references :tipo_tarifa, foreign_key: true
      t.references :tipo_entrega, foreign_key: true
      t.references :tipo_establecimiento, foreign_key: true
    

      t.timestamps
    end
  end
end
