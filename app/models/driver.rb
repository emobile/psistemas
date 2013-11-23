class Driver < ActiveRecord::Base
  belongs_to :user
  belongs_to :truck
  belongs_to :branch
  belongs_to :company
  
    def driver_name
    user.fullname
  end
  
  def driver_truck
    user.fullname + " " + " (" + truck.modelbrand + ")"
  end
end
