json.array!(@tasks) do |task|
  json.extract! task, :name, :driver_id, :branch_id, :company_id, :completed, :priority, :scheduled_date, :latitude, :longitude, :description, :comments, :completed_at
  json.url task_url(task, format: :json)
end
