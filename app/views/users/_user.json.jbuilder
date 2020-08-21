json.extract! user, :id, :username, :password, :name, 0, 0, :created_at, :updated_at
json.url user_url(user, format: :json)
