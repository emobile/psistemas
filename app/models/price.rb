class Price < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  belongs_to :product
  belongs_to :client_type
  belongs_to :measurement_unit
  validates  :company_id, :branch_id, :product_id, :client_type_id, :measurement_unit_id, :price, :presence => true
  validates_numericality_of :price, :greater_than => 0, :message => I18n.t('messages.errors.incorrect_price')
  validates_uniqueness_of :product_id, :scope => [:branch_id, :client_type_id, :measurement_unit_id], :on => :create, :message => I18n.t('messages.errors.price_is_already_set')

  def price_with_unit
    "$" + price.to_s + " (" + measurement_unit.name + ")"
  end

end
