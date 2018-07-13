class CreateContratistaSubempresas < ActiveRecord::Migration[5.0]
  def change
    create_table :contratista_subempresas do |t|
      t.references :contratistum, foreign_key: true
      t.references :subempresa, foreign_key: true

      t.timestamps
    end
  end
end
