class AddAnalisisToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :analisis, :integer
  end
end
