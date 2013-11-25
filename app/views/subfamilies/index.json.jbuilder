json.array!(@subfamilies) do |subfamily|
  json.extract! subfamily, :name, :description, :family_id, :company_id, :branch_id, :client_id, :client_branch_id
  json.url subfamily_url(subfamily, format: :json)
end
