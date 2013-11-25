json.array!(@families) do |family|
  json.extract! family, :name, :description, :company_id, :branch_id, :client_id, :client_branch_id
  json.url family_url(family, format: :json)
end
