class Driver < ApplicationRecord
    has_many :driver_vehicles
    has_many :vehicles, through: :driver_vehicles

    validates :first_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }
    validates :last_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }
    validates :phone, presence: true
    validates :phone, numericality: { only_integer: true }
    validates :phone, length: { is: 10 }
    validates :email, presence: true, email: true
    validates :driver_license_number, presence: true
    validates :medical_card_expiration, presence: false, if: -> { medical_card? }
    validates :driver_application_doc, :drug_test_date, :mvr_report_date, :clearinghouse_date, presence: false
    
    def full_name
        "#{first_name} #{last_name}"
    end

    def assigned_vehicle
        vehicles.first
    end
end
