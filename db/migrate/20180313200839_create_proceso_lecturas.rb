class CreateProcesoLecturas < ActiveRecord::Migration[5.0]
  def change
    create_table :proceso_lecturas do |t|
      t.string :codigo

      t.timestamps
    end
  end
end
