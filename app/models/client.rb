class Client < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
end
