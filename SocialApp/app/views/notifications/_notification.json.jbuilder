json.extract! notification, :id, :body, :created_at, :updated_at
json.url notification_url(notification, format: :json)
