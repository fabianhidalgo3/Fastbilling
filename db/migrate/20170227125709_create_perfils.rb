class CreatePerfils < ActiveRecord::Migration[5.0]
  def change
    create_table :perfils do |t|
      t.string :nombre
      t.string :imagen

      t.timestamps
    end
  end
end
