class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.text :description
      t.references :company, index: true

      t.timestamps
    end
  end
end
