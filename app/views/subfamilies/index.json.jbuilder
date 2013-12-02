json.array!(@subfamilies) do |subfamily|
  json.extract! subfamily, :name, :description, :family_id, :company_id
  json.url subfamily_url(subfamily, format: :json)
end
