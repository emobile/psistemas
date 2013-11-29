class Stock < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
end
