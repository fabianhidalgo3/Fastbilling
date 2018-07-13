class AddCampos3ToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :meses_sin_lectura, :integer
    add_column :orden_lecturas, :meses_sin_consumo, :integer
    add_column :orden_lecturas, :flag_corte_suministro, :boolean
    add_column :orden_lecturas, :estado_corte, :boolean
    add_column :orden_lecturas, :lectura_obligada, :boolean
    add_column :orden_lecturas, :secuencia_lector, :integer
  end
end
