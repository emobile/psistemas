class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :company, index: true
      t.references :branch, index: true
      t.references :storage, index: true

      t.timestamps
    end
  end
end
