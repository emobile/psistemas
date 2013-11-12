class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name,  :null => false
      t.string :last_name,  :null => false
      t.string :phone1,  :null => false
      t.string :phone2
      t.string :fax
      t.string :address1,  :null => false
      t.string :address2
      t.string :city,  :null => false
      t.string :state,  :null => false
      t.integer :zip,  :null => false
      t.string :country,  :null => false
      t.references :company, index: true,  :null => false
      t.references :branch, index: true,  :null => false
      t.references :role, index: true,  :null => false      
      t.boolean :active,  :null => false, :default => true

      t.timestamps
    end
  end
end
