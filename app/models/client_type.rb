class ClientType < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  has_many :clients, :dependent => :destroy
  validates :name, :description, :company_id, :branch_id, :presence => true  
  validates_length_of :name, :maximum => 200
  validates_length_of :description, :maximum => 1200
  validates_uniqueness_of :name, :scope => [:branch_id], :on => :create, :message => I18n.t('messages.errors.client_type_is_already_set')
end
