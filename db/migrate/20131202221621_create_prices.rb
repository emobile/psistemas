class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :price
      t.text :description
      t.references :client_type, index: true      
      t.references :company, index: true
      t.references :branch, index: true
      t.references :product, index: true
      t.references :measurement_unit, index: true

      t.timestamps
    end
  end
end
