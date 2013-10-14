json.array!(@error_reports) do |error_report|
  json.extract! error_report, :user_id, :controller_name, :action_name, :line_number, :referrer_url, :original_path, :environment, :branch_id, :company_id, :description, :backtrace, :error_time
  json.url error_report_url(error_report, format: :json)
end
