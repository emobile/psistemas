class CreateAvatarsForRailsCompany < ActiveRecord::Migration
  def up    
    add_attachment :companies, :logo
  end
  
  def self.down
    remove_attachment :companies, :logo
  end
end
