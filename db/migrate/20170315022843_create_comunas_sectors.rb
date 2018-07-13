class CreateComunasSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :comunas_sectors do |t|
      t.references :comuna, foreign_key: true
      t.references :sector, foreign_key: true

      t.timestamps
    end
  end
end
