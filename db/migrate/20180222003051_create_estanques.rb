class CreateEstanques < ActiveRecord::Migration[5.0]
  def change
    create_table :estanques do |t|
      t.string :codigo
      t.string :descripcion

      t.timestamps
    end
  end
end
