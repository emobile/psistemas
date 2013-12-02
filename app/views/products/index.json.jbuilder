json.array!(@products) do |product|
  json.extract! product, :name, :description, :company_id, :branch_id, :storage_id
  json.url product_url(product, format: :json)
end
