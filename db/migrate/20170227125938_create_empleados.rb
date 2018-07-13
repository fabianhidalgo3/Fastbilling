class CreateEmpleados < ActiveRecord::Migration[5.0]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :rut
      t.references :contratistum, foreign_key: true
      t.references :subempresa, foreign_key: true

      t.timestamps
    end
  end
end
