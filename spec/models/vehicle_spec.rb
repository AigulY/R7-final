require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject {
    described_class.new(
      unit_number: "12345",
      plate_number: "ABC123",
      vin_number: "1HGBH41JXMN109186",
      registration_expiration: Date.today + 1.year,
      insurance_expiration: Date.today + 1.year
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a unit_number" do
    subject.unit_number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a plate_number" do
    subject.plate_number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a vin_number" do
    subject.vin_number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the vin_number is not 17 characters" do
    subject.vin_number = "123"
    expect(subject).to_not be_valid
  end

  it "is not valid without a registration_expiration" do
    subject.registration_expiration = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an insurance_expiration" do
    subject.insurance_expiration = nil
    expect(subject).to_not be_valid
  end

end
