json.array!(@comments) do |comment|
  json.extract! comment, :user_id, :email, :comment, :app_name, :branch_id, :company_id
  json.url comment_url(comment, format: :json)
end
