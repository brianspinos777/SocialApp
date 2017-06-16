json.extract! photo, :id, :status, :created_at, :updated_at
json.url photo_url(photo, format: :json)
