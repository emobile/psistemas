json.array!(@trucks) do |truck|
  json.extract! truck, :model, :brand, :year, :truck_type, :plate_no, :serial_no, :color, :wheels_no, :other, :identifier, :branch_id, :company_id
  json.url truck_url(truck, format: :json)
end
