class AddCodigoToTipoLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :tipo_lecturas, :codigo, :string
  end
end
