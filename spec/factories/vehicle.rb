FactoryBot.define do
    factory :vehicle do
      unit_number { "12345" }
      plate_number { "ABC123" }
      vin_number { "1HGBH41JXMN109186" }
      registration_expiration { 1.year.from_now }
      insurance_expiration { 1.year.from_now }
    end
end