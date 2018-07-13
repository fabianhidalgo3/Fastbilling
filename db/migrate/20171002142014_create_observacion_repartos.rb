class CreateObservacionRepartos < ActiveRecord::Migration[5.0]
  def change
    create_table :observacion_repartos do |t|
      t.string :observacion
      t.boolean :efectivo

      t.timestamps
    end
  end
end
