class CreateCellphones < ActiveRecord::Migration
  def change
    create_table :cellphones do |t|
      t.string :phone_number
      t.string :model
      t.string :brand
      t.string :color
      t.string :ope_system
      t.text :condition
      t.string :imei
      t.text :description
      t.references :user, index: true
      t.references :branch, index: true
      t.references :company, index: true

      t.timestamps
    end
  end
end
