class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :branch
  belongs_to :company
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
