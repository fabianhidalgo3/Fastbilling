class CreateEstadoFacturacions < ActiveRecord::Migration[5.0]
  def change
    create_table :estado_facturacions do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
