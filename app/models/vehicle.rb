class Vehicle < ApplicationRecord
  has_many :driver_vehicles
  has_many :drivers, through: :driver_vehicles
  
   belongs_to :driver, optional: true

   validates_associated :driver
  
    validates :unit_number, presence: true
    validates :plate_number, presence: true
    # validates :vin_number, presence: true, length: { is: 17 }
    # validates :registration_expiration, :insurance_expiration, presence: true
  end
  
