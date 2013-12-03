json.array!(@prices) do |price|
  json.extract! price, :price, :description, :company_id, :branch_id, :product_id, :client_type_id, :measurement_unit_id
  json.url price_url(price, format: :json)
end
