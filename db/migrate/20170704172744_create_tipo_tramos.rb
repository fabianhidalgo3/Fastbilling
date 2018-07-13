class CreateTipoTramos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_tramos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
