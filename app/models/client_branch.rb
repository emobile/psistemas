class ClientBranch < ActiveRecord::Base
  belongs_to :client
  belongs_to :company
  belongs_to :branch
end
