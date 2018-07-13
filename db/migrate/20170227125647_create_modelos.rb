class CreateModelos < ActiveRecord::Migration[5.0]
  def change
    create_table :modelos do |t|
      t.string :nombre
      t.text :caracteristicas
      t.references :marca, foreign_key: true

      t.timestamps
    end
  end
end
