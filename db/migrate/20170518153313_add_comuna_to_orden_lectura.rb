class AddComunaToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_lecturas, :comuna, foreign_key: true
  end
end
