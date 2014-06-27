json.array!(@users) do |user|
  json.extract! user, :id, :name, :phonenumber
  json.url user_url(user, format: :json)
end
