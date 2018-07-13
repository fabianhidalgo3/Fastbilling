class AddObservacionToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :observacion, :string
  end
end
