class AddDatosDosValidacionToObservacione < ActiveRecord::Migration[5.0]
  def change
    add_column :observaciones, :folio, :boolean
  end
end
