json.array!(@client_branches) do |client_branch|
  json.extract! client_branch, :name, :contact, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description, :client_id, :company_id, :branch_id, :latitude, :longitude
  json.url client_branch_url(client_branch, format: :json)
end
