class AddMesaanoToRuta < ActiveRecord::Migration[5.0]
  def change
    add_column :ruta, :mes, :integer
    add_column :ruta, :ano, :integer
  end
end
