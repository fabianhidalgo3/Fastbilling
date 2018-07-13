class CreateLocalidades < ActiveRecord::Migration[5.0]
  def change
    create_table :localidades do |t|
      t.string :codigo
      t.string :nombre
      t.references :zona, foreign_key: true

      t.timestamps
    end
  end
end
