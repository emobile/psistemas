json.array!(@messages) do |message|
  json.extract! message, :message, :user_id, :branch_id, :company_id
  json.url message_url(message, format: :json)
end
