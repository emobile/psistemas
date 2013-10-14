class Comment < ActiveRecord::Base
  belongs_to :user
  validates :comment, :email, :user_id, :app_name, :presence => true
  validates_length_of :comment, :maximum => 5000
    
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
