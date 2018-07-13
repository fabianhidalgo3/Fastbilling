class AddNuevosCamposToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :perfil, foreign_key: true
  end
end
