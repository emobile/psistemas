class Cellphone < ActiveRecord::Base
  belongs_to :user
  belongs_to :branch
  belongs_to :company
end
