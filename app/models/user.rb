class User < ActiveRecord::Base
  acts_as_avatarable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :confirmable 
  

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login, :fullname
  belongs_to :role
  belongs_to :company
  belongs_to :branch
  has_many :cellphones, :dependent => :destroy  
  has_many :comments, :dependent => :destroy 
  validates :first_name, :last_name, :username, :phone1, :address1, :address2, :city, :state, :zip, :country, :branch_id, :company_id, :role_id, :presence => true
  validates :username, :uniqueness => true
  validates :phone1, :zip, :numericality => {:only_integer => true}
  validates :phone2, :fax, :numericality => {:only_integer => true}, :allow_blank => true  
  validates_length_of :email, :maximum => 120
  validates_length_of :first_name, :last_name, :address1, :address2, :city, :state, :maximum => 100
  validates :zip, :length => { :within => 5..5 }
  validates :phone1, :length => { :within => 10..15 } 
  validates :phone2, :fax, :length => { :within => 10..15 }, :allow_blank => true  
  validates :username, :length => { :within => 8..30 }, :allow_blank => true
  validates :password, :length => { :within => 8..30 },  :allow_blank => true
  validates_format_of :email, :with => /^\w+([\.-]?\w+)*@[a-zA-Z0-9]+([\.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,3})+$/i, :multiline => true
  
  self.per_page = 15
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |model|
        csv << model.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  end
  
  #protected

  # Attempt to find a user by it's email. If a record is found, send new
  # password instructions to it. If not user is found, returns a new user
  # with an email not found error.
  def self.send_reset_password_instructions(attributes={})
    recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    recoverable.send_reset_password_instructions if recoverable.persisted?
    recoverable
  end 

  def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
    (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

    attributes = attributes.slice(*required_attributes)
    attributes.delete_if { |key, value| value.blank? }

    if attributes.size == required_attributes.size
      if attributes.has_key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
      else  
        record = where(attributes).first
      end  
    end  

    unless record
      record = new

      required_attributes.each do |key|
        value = attributes[key]
        record.send("#{key}=", value)
        record.errors.add(key, value.present? ? error : :blank)
      end  
    end  
    record
  end

  def self.find_record(login)
    where(["username = :value OR email = :value", { :value => login }]).first
  end 

  public
  
  def fulladdress
    address1.titlecase + " " + address2.titlecase + " " + zip.to_s +  " " + city.titlecase + ", "  + state.titlecase + " " + country.titlecase
  end
  
  def fullname
    first_name.titlecase + " " + last_name.titlecase 
  end
  
  def name_username
    first_name.titlecase + " " + last_name.titlecase + " (" + username + ")"
  end 
  
end
