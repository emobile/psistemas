class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.references :user, index: true
      t.references :truck, index: true
      t.references :branch, index: true
      t.references :company, index: true

      t.timestamps
    end
  end
end
