class CreateFactorCobros < ActiveRecord::Migration[5.0]
  def change
    create_table :factor_cobros do |t|
      t.references :subempresa, foreign_key: true
      t.references :sector, foreign_key: true
      t.references :tipo_sector, foreign_key: true
      t.references :tipo_tarifa, foreign_key: true
      t.decimal :cargo_fijo
      t.decimal :cargo_unico
      t.decimal :cargo_energia_base
      t.decimal :cargo_energia_adicional
      t.decimal :precio_energia_inyectada

      t.timestamps
    end
  end
end
