class AddFactorCobroRefToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_lecturas, :factor_cobro, foreign_key: true
  end
end
