class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name,  :null => false, :default => ""
      t.boolean :protected,  :null => false, :default => false
      t.boolean :super_admin,  :null => false, :default => false
      t.boolean :clinic_manager,  :null => false,  :default => false
      t.boolean :doctor,  :null => false,  :default => false
      t.boolean :secretary,  :null => false,  :default => false
      t.boolean :patient,  :null => false,  :default => false
      t.boolean :guess,  :null => false,  :default => false
      t.text :description,  :null => false, :default => ""

      t.timestamps
    end
  end
end
