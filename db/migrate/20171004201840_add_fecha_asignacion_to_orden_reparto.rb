class AddFechaAsignacionToOrdenReparto < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_repartos, :fecha_asignacion, :datetime
  end
end
