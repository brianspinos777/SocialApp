json.extract! reaction, :id, :reactable_id, :reactable_type, :user_id, :reaction_type, :created_at, :updated_at
json.url reaction_url(reaction, format: :json)
