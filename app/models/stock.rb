class Stock < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  belongs_to :storage
  belongs_to :product
  belongs_to :measurement_unit
  validates :quantity, :measurement_unit_id, :storage_id, :product_id, :company_id, :branch_id, :presence => true
  validates :quantity, :numericality => {:only_integer => true, :greater_than => 0}
  validates_uniqueness_of :product_id, :scope => [:storage_id, :measurement_unit_id], :on => :create, :message => I18n.t('messages.errors.product_on_stock')

  def product_unit
    product.name + "(" + measurement_unit.name + ")"
  end
  
end
