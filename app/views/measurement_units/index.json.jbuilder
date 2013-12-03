json.array!(@measurement_units) do |measurement_unit|
  json.extract! measurement_unit, :name, :description, :company_id, :branch_id
  json.url measurement_unit_url(measurement_unit, format: :json)
end
