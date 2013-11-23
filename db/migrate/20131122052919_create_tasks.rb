class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :driver, index: true
      t.references :branch, index: true
      t.references :company, index: true
      t.boolean :completed
      t.string :priority
      t.date :scheduled_date
      t.float :latitude
      t.float :longitude
      t.text :description
      t.text :comments
      t.datetime :completed_at

      t.timestamps
    end
  end
end
