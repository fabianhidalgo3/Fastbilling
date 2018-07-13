json.extract! ruta_reparto, :id, :codigo, :nombre, :porcion_reparto_id, :created_at, :updated_at
json.url ruta_reparto_url(ruta_reparto, format: :json)
