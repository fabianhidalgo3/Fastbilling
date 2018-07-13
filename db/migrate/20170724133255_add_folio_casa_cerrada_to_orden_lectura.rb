class AddFolioCasaCerradaToOrdenLectura < ActiveRecord::Migration[5.0]
  def change
    add_column :orden_lecturas, :folio_casa_cerrada, :integer
  end
end
