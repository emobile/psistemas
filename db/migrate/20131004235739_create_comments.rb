class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.string :email,  :null => false
      t.text :comment,  :null => false
      t.string :app_name,  :null => false
      t.references :company, index: true,  :null => false
      t.references :branch, index: true,  :null => false      

      t.timestamps
    end
  end
end
