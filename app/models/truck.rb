class Truck < ActiveRecord::Base
  belongs_to :branch
  belongs_to :company
  validates :brand, :model, :plate_no, :branch_id, :company_id, :presence => true
  validates_length_of :brand, :model, :other, :maximum => 150
  validates_length_of :year, :is => 4
  def modelbrand
    model.titlecase + " " + brand.titlecase + " " + year.to_s
  end
end
