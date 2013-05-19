json.array!(@passwords) do |password|
  json.extract! password, :title, :description, :application_id, :password
  json.url password_url(password, format: :json)
end