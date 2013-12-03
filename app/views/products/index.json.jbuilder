json.array!(@products) do |product|
  json.extract! product, :name, :description, :family_id, :subfamily_id, :company_id
  json.url product_url(product, format: :json)
end
