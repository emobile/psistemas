class Client < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  validates :name, :email1, :phone1, :address1, :address2, :city, :state, :zip, :country, :presence, :company_id, :branch_id, :presence => true  
  validates :name, :uniqueness => true
  validates :phone1, :zip, :numericality => {:only_integer => true}
  validates :phone2, :fax, :numericality => {:only_integer => true}, :allow_blank => true  
  validates_length_of :email1, :maximum => 120
  validates_length_of :email2, :maximum => 120, :allow_blank => true    
  validates_length_of :name, :address1, :address2, :city, :maximum => 200
  validates :zip, :length => { :within => 5..5 }
  validates :phone1, :length => { :within => 10..15 } 
  validates :phone2, :fax, :length => { :within => 10..15 }, :allow_blank => true  
  validates_format_of :email1, :with => /^\w+([\.-]?\w+)*@[a-zA-Z0-9]+([\.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,3})+$/i, :multiline => true  
  validates_format_of :email2, :with => /^\w+([\.-]?\w+)*@[a-zA-Z0-9]+([\.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,3})+$/i, :multiline => true, :allow_blank => true
  
  def fulladdress
    address1.titlecase + " " + address2.titlecase + " " + zip.to_s +  " " + city.titlecase + ", "  + state.titlecase + " " + country.titlecase
  end
end
