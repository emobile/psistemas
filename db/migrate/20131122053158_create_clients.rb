class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :contact
      t.string :email1
      t.string :email2
      t.string :webpage
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.text :description
      t.references :company, index: true
      t.references :branch, index: true
      t.references :client_type, index: true      
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
