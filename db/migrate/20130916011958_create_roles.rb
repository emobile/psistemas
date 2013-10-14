class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name,  :null => false
      t.boolean :protected,  :null => false, :default => false
      t.boolean :super_admin,  :null => false, :default => false
      t.boolean :company_admin,  :null => false, :default => false
      t.boolean :branch_admin,  :null => false, :default => false      
      t.boolean :super_manager,  :null => false,  :default => false
      t.boolean :manager,  :null => false,  :default => false
      t.boolean :routes_admin,  :null => false, :default => false
      t.boolean :seller,  :null => false, :default => false
      t.boolean :secretary,  :null => false,  :default => false
      t.boolean :driver,  :null => false, :default => false
      t.boolean :client,  :null => false,  :default => false
      t.boolean :guess,  :null => false,  :default => false
      t.text :description,  :null => false

      t.timestamps
    end
  end
end
