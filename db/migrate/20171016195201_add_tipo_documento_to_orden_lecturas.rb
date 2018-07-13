class AddTipoDocumentoToOrdenLecturas < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_lecturas, :tipo_documento, foreign_key: true
  end
end
