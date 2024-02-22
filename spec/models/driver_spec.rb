require 'rails_helper'

RSpec.describe Driver, type: :model do
  let(:vehicle) { FactoryBot.create(:vehicle) }

  subject {
    described_class.new(
      first_name: "John",
      last_name: "Doe",
      phone: "1234567890",
      email: "jdoe@example.com",
      driver_license_number: "D123456789",
      medical_card: true,
      medical_card_expiration: Date.today + 1.year,
      driver_application_doc: "Some document",
      drug_test_date: Date.today - 1.month,
      mvr_report_date: Date.today - 1.month,
      clearinghouse_date: Date.today - 1.month,
      vehicle: vehicle
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone number" do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the phone number is not 10 chars" do
    subject.phone = "12345"
    expect(subject).to_not be_valid
  end

  it "is not valid without a driver_license_number" do
    subject.driver_license_number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a medical_card_expiration if medical_card is true" do
    subject.medical_card_expiration = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a driver_application_doc" do
    subject.driver_application_doc = nil
    expect(subject).to_not be_valid
  end

  it "returns the correct full_name" do
    expect(subject.full_name).to eq("John Doe")
  end

end