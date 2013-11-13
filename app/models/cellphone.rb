class Cellphone < ActiveRecord::Base
  belongs_to :user
  belongs_to :branch
  belongs_to :company
  
  def model_brand
    brand + " " + model
  end
  
end
