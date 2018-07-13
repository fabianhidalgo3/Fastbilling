class AddReferenciaComunaToCiudad < ActiveRecord::Migration[5.0]
  def change
    add_reference :ciudads, :comuna, foreign_key: true
  end
end
