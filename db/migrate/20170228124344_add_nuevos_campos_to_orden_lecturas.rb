class AddNuevosCamposToOrdenLecturas < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :nro_municipal, :string
  end
end
