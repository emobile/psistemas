class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.text :description
      t.integer :hierarchy
      t.string :model_name

      t.timestamps
    end
  end
end
