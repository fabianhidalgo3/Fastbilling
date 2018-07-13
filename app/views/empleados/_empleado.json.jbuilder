json.extract! empleado, :id, :nombre, :apellido_paterno, :apellido_materno, :rut, :contratistum_id, :subempresa_id, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
