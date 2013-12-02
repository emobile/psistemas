class Family < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  belongs_to :client
  belongs_to :client_branch
  self.per_page = 15
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |model|
        csv << model.attributes.values_at(*column_names)
      end
    end
  end
end
