class AddRefAparatoToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_lecturas, :tipo_aparato, foreign_key: true
  end
end
