json.array!(@stocks) do |stock|
  json.extract! stock, :company_id, :branch_id, :storage_id, :product_id, :quantity
  json.url stock_url(stock, format: :json)
end
