class AddEstadoToRutaRepartos < ActiveRecord::Migration[5.0]
  def change
    add_column :ruta_repartos, :abierto, :boolean
  end
end
