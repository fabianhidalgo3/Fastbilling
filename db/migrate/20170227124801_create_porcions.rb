class CreatePorcions < ActiveRecord::Migration[5.0]
  def change
    create_table :porcions do |t|
      t.string :codigo
      t.string :nombre
      t.integer :ano
      t.integer :mes
      t.references :zona, foreign_key: true
      t.references :subempresa, foreign_key: true

      t.timestamps
    end
  end
end
