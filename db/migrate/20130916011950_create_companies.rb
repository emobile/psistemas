class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name,  :null => false
      t.string :contact,  :null => false
      t.string :email1,  :null => false
      t.string :email2
      t.string :webpage
      t.string :phone1,  :null => false
      t.string :phone2
      t.string :fax
      t.string :address1,  :null => false
      t.string :address2,  :null => false
      t.string :city,  :null => false
      t.string :state,  :null => false
      t.integer :zip,  :null => false
      t.string :country,  :null => false
      t.text :description

      t.timestamps
    end
  end
end
