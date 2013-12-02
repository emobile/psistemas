class Cellphone < ActiveRecord::Base
  belongs_to :user
  belongs_to :branch
  belongs_to :company
  validates  :phone_number, :brand, :model, :imei, :branch_id, :company_id, :presence => true
  validates_length_of :model, :brand, :color, :ope_system, :maximum => 200
  validates_length_of :condition, :description, :maximum => 1000
  validates :imei, :phone_number, :uniqueness => true
  validates :imei, :phone_number, :branch_id, :company_id, :numericality => {:only_integer => true}
  validates :imei, :length => { :within => 14..15 }
  validates :phone_number, :length => { :within => 10..15 } 
  def model_brand
    brand + " " + model
  end
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
