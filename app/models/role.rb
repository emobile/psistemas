class Role < ActiveRecord::Base
  has_many :users
  validates :description, :name, :presence => true
  validates :name, :description, :uniqueness => true
  validates_length_of :name, :maximum => 150
  validates_length_of :description, :maximum => 3000
  validate :rol_type
  
  self.per_page = 15
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |model|
        csv << model.attributes.values_at(*column_names)
      end
    end
  end
  
  def rol_type
    errors.add(:base, I18n.t('activerecord.errors.messages.rol_type')) unless super_admin || company_admin || branch_admin || super_manager || manager || routes_admin || seller || secretary || driver || client  || guess
  end
  
end
