class AddCondClimaticaToRutum < ActiveRecord::Migration[5.0]
  def change
    add_column :ruta, :condicion_climatica, :string
  end
end
