class ClientType < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  has_many :clients, :dependent => :destroy
end
