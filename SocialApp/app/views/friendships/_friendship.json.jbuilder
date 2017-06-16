json.extract! friendship, :id, :from_user_id, :to_user_id, :accepted, :created_at, :updated_at
json.url friendship_url(friendship, format: :json)
