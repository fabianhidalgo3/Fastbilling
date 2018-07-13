class AddCodigoToObservacionRepartos < ActiveRecord::Migration[5.0]
  def change
    add_column :observacion_repartos, :codigo, :string
  end
end
