class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name,  :null => false
      t.string :contact_name,  :null => false
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
      t.boolean :main_branch,  :null => false, :default => false
      t.text :description
      t.references :company, index: true

      t.timestamps
    end
  end
end
