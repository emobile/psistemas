class Subfamily < ActiveRecord::Base
  belongs_to :family
  belongs_to :company
  belongs_to :branch
  belongs_to :client
  belongs_to :client_branch
end
