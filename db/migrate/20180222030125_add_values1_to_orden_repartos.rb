class AddValues1ToOrdenRepartos < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_repartos, :estanques, foreign_key: true
  end
end
