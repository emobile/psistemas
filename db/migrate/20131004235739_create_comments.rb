class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.string :email
      t.text :comment
      t.string :app_name

      t.timestamps
    end
  end
end
