class Company < ActiveRecord::Base
  acts_as_avatarable  
  has_many :users, :dependent => :destroy
  has_many :branches, :dependent => :destroy
  has_many :storages, :dependent => :destroy
  has_many :error_reports, :dependent => :destroy 
  has_many :cellphones, :dependent => :destroy 
  has_many :trucks, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  validates :name, :email1, :phone1, :address1, :address2, :city, :state, :zip, :country, :presence => true  
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
  validates :webpage, :format => URI::regexp(%w(http https))
  
  self.per_page = 15
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |model|
        csv << model.attributes.values_at(*column_names)
      end
    end
  end
  
  def fulladdress
    address1.titlecase + " " + address2.titlecase + " " + zip.to_s +  " " + city.titlecase + ", "  + state.titlecase + " " + country.titlecase
  end
  
end
