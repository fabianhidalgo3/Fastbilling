class AddRelecturaToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :relectura, :boolean
  end
end
