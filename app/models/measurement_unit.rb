class MeasurementUnit < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  has_many :prices, :dependent => :destroy
end
