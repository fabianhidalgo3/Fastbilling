class CreateEmpresaSubempresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresa_subempresas do |t|
      t.references :empresa, foreign_key: true
      t.references :subempresa, foreign_key: true

      t.timestamps
    end
  end
end
