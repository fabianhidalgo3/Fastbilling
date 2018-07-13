class AddInstalacionReferencesToOrdenReparto < ActiveRecord::Migration[5.0]
  def change
    add_reference :orden_repartos, :instalacion, foreign_key: true
  end
end
