class CreateEstadoRepartos < ActiveRecord::Migration[5.0]
  def change
    create_table :estado_repartos do |t|
      t.string :estado

      t.timestamps
    end
  end
end
