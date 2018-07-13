class AddEstadoToPorcionRepartos < ActiveRecord::Migration[5.0]
  def change
    add_column :porcion_repartos, :abierto, :boolean
  end
end
