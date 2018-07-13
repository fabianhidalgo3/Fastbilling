class AddRefOrdenComunasOrdenLecturas < ActiveRecord::Migration[5.0]
  def change
  	add_reference :comunas, foreign_key: true
  end
end
