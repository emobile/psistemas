json.array!(@statuses) do |status|
  json.extract! status, :name, :description, :hierarchy, :model_name
  json.url status_url(status, format: :json)
end
