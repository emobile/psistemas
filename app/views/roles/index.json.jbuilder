json.array!(@roles) do |role|
  json.extract! role, :name, :protected, :super_admin, :company_admin, :branch_admin, :super_manager, :manager, routes_admin, :seller, :secretary, :driver, :client, :guess, :description, :created_at, :updated_at
  json.url role_url(role, format: :json)
end
