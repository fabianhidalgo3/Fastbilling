class AddEstadoToRutum < ActiveRecord::Migration[5.0]
  def change
    add_column :ruta, :abierto, :boolean
  end
end
