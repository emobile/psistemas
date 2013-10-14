class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name,  :null => false, :default => ""
      t.string :last_name,  :null => false, :default => ""
      t.string :phone1,  :null => false, :default => ""
      t.string :phone2
      t.string :fax
      t.string :address1,  :null => false, :default => ""
      t.string :address2
      t.string :city,  :null => false, :default => ""
      t.string :state,  :null => false, :default => ""
      t.integer :zip,  :null => false
      t.string :country,  :null => false, :default => ""
      t.references :company, index: true,  :null => false
      t.references :branch, index: true,  :null => false
      t.references :role, index: true,  :null => false      
      t.boolean :active,  :null => false, :default => true

      t.timestamps
    end
  end
end
