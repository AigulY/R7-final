class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :driver_license_number
      t.boolean :medical_card
      t.date :medical_card_expiration
      t.date :driver_application_doc
      t.date :drug_test_date
      t.date :mvr_report_date
      t.date :clearinghouse_date
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
