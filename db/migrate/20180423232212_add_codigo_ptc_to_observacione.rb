class AddCodigoPtcToObservacione < ActiveRecord::Migration[5.0]
  def change
    add_column :observaciones, :codigo_ptc, :string
  end
end
