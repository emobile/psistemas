json.array!(@branches) do |branch|
  json.extract! branch, :name, :contact_name, :main_branch, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description, :company_id
  json.url branch_url(branch, format: :json)
end
