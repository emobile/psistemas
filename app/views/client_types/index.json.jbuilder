json.array!(@client_types) do |client_type|
  json.extract! client_type, :name, :description, :company_id, :branch_id
  json.url client_type_url(client_type, format: :json)
end
