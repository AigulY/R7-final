class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :unit_number
      t.string :plate_number
      t.string :vin_number
      t.date :registration_expiration
      t.date :insurance_expiration
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
