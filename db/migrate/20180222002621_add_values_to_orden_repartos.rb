class AddValuesToOrdenRepartos < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_repartos, :calle, :string
    add_column :orden_repartos, :nro, :string
    add_column :orden_repartos, :edificio, :string
    add_column :orden_repartos, :depto, :string
    add_column :orden_repartos, :piso, :string
  end
end
