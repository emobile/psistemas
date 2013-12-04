class Product < ActiveRecord::Base
  belongs_to :company
  belongs_to :family
  belongs_to :subfamily
  has_many :prices, :dependent => :destroy
  validates  :company_id, :family_id, :subfamily_id, :presence => true
  #validates_numericality_of :price, :greater_than => 0, :message => I18n.t('messages.errors.incorrect_price')
  accepts_nested_attributes_for :prices, :allow_destroy => true
  #validates :prices, :presence => { :message => I18n.t('activerecord.errors.messages.you_need_to_set_at_least_base_price') }
end
