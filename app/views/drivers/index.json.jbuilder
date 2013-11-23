json.array!(@drivers) do |driver|
  json.extract! driver, :user_id, :truck_id, :branch_id, :company_id
  json.url driver_url(driver, format: :json)
end
