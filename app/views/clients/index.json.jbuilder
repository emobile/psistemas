json.array!(@clients) do |client|
  json.extract! client, :name, :contact, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description, :company_id, :branch_id, :latitude, :longitude
  json.url client_url(client, format: :json)
end
