json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :role_id, :active
  json.url user_url(user, format: :json)
end
