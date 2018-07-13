class AddCodigoToObservacione < ActiveRecord::Migration[5.0]
  def change
    add_column :observaciones, :codigo, :string
  end
end
