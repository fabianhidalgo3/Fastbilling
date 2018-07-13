class CreateResumenLecturas < ActiveRecord::Migration[5.0]
  def change
    create_table :resumen_lecturas do |t|
      t.references :porcion, foreign_key: true
      t.string :proceso
      t.datetime :fecha_lectura
      t.string :conndicion_climatica
      t.integer :asignado_plectura
      t.integer :claven_plectura
      t.integer :pendiente_plectura
      t.integer :sin_lectura_plectura
      t.decimal :efec_diad_mes_anterior, :precision=> 6, :scale => 2
      t.decimal :meta, :precision=> 6, :scale => 2
      t.integer :asignado_repaso
      t.decimal :inverosimil, :precision=> 6, :scale => 2
      t.integer :claven_repaso
      t.integer :sin_elctura
      t.decimal :efect_repaso, :precision=> 6, :scale => 2
      t.integer :clave_nd_repaso
      t.datetime :fecha_mes_actual
      t.datetime :fecha_mes_anterior
      t.datetime :fecha_mes_ano_anterior
      t.timestamps
    end
  end
end
