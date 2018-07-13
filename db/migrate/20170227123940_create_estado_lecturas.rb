class CreateEstadoLecturas < ActiveRecord::Migration[5.0]
  def change
    create_table :estado_lecturas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
