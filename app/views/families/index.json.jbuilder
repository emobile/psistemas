json.array!(@families) do |family|
  json.extract! family, :name, :description, :company_id
  json.url family_url(family, format: :json)
end
