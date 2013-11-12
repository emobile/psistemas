json.array!(@cellphones) do |cellphone|
  json.extract! cellphone, :phone_number, :model, :brand, :color, :ope_system, :condition, :imei, :description, :user_id, :branch_id, :company_id
  json.url cellphone_url(cellphone, format: :json)
end
