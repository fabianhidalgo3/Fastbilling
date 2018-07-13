class CreateMedidors < ActiveRecord::Migration[5.0]
  def change
    create_table :medidors do |t|
      t.string :numero_medidor
      t.references :modelo, foreign_key: true
      t.boolean :propiedad_cliente
      t.timestamps
    end
  end
end
