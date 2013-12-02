class Product < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  belongs_to :storage
end
