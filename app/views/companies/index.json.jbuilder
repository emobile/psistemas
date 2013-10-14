json.array!(@companies) do |company|
  json.extract! company, :name, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description
  json.url company_url(company, format: :json)
end
