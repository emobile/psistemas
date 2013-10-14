json.array!(@roles) do |role|
  json.extract! role, :name, :protected, :super_admin, :clinic_manager, :doctor, :secretary, :patient, :description
  json.url role_url(role, format: :json)
end
