class Stock < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  belongs_to :storage
  belongs_to :product
end
