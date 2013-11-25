class CreateSubfamilies < ActiveRecord::Migration
  def change
    create_table :subfamilies do |t|
      t.string :name
      t.text :description
      t.references :family, index: true
      t.references :company, index: true
      t.references :branch, index: true
      t.references :client, index: true
      t.references :client_branch, index: true

      t.timestamps
    end
  end
end
