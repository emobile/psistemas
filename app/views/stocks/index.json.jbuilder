json.array!(@stocks) do |stock|
  json.extract! stock, :name, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description, :company_id, :branch_id
  json.url stock_url(stock, format: :json)
end
