class CreateTipoCobros < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_cobros do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
