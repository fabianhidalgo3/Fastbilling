class AddNuevosCamposToEmpleado < ActiveRecord::Migration[5.0]
  def change
    add_reference :empleados, :usuario, foreign_key: true
  end
end
