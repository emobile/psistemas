json.array!(@storages) do |storage|
  json.extract! storage, :name, :contact, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description, :company_id, :branch_id
  json.url storage_url(storage, format: :json)
end
