class AddCuidadToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_lecturas, :ciudad, foreign_key: true
  end
end
