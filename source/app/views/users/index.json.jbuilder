json.array!(@users) do |user|
  json.extract! user, :id, :name, :last_name, :login, :password, :active
  json.url user_url(user, format: :json)
end
