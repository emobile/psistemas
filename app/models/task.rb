class Task < ActiveRecord::Base
  belongs_to :driver
  belongs_to :branch
  belongs_to :company
end
