class Stock < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  belongs_to :storage
  belongs_to :product
  belongs_to :price
  validates :quantity, :price_id, :storage_id, :product_id, :company_id, :branch_id, :presence => true
  validates :quantity, :numericality => {:only_integer => true, :greater_than => 0}
end
