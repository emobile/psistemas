class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :company, index: true
      t.references :branch, index: true
      t.references :storage, index: true
      t.references :product, index: true
      t.references :price, index: true     
      t.float :quantity

      t.timestamps
    end
  end
end
