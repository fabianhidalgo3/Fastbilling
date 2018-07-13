class CreateComunasFactorCobros < ActiveRecord::Migration[5.0]
  def change
    create_table :comunas_factor_cobros do |t|
      t.references :factor_cobro, foreign_key: true
      t.references :comuna, foreign_key: true

      t.timestamps
    end
  end
end
