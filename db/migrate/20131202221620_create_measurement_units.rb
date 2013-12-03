class CreateMeasurementUnits < ActiveRecord::Migration
  def change
    create_table :measurement_units do |t|
      t.string :name
      t.text :description
      t.references :company, index: true
      t.references :branch, index: true

      t.timestamps
    end
  end
end
