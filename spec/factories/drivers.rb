FactoryBot.define do
  factory :driver do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::Number.number(digits: 10) }
    email { Faker::Internet.email }
    driver_license_number { "D123456789" }
    driver_application_doc { "Some content here" }
    drug_test_date { Date.today }
    mvr_report_date { Date.today }
    clearinghouse_date { Date.today }
    association :vehicle
  end
end