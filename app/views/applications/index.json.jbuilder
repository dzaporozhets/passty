json.array!(@applications) do |application|
  json.extract! application, :title, :url, :description, :user_id
  json.url application_url(application, format: :json)
end