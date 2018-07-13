class AddFoliosToDocumentos < ActiveRecord::Migration[5.0]
  def change
     add_reference :documentos, :folio, foreign_key: true
  end
end
