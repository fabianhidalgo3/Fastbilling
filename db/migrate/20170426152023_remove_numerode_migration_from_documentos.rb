class RemoveNumerodeMigrationFromDocumentos < ActiveRecord::Migration[5.0]
  def change
    remove_column :documentos, :numero_documento, :integer
  end
end
