class AddGpsToOrdenReparto < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_repartos, :gps_longitud, :decimal, :precision => 10, :scale => 7
    add_column :orden_repartos, :gps_latitud, :decimal, :precision => 10, :scale => 7
  end
end
