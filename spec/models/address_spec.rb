require 'rails_helper'

RSpec.describe Address, :type => :model do
  let(:address) { Address.new(street_number: "1", street: "a", city: "m" , state: "CO" , zip: "10000") }
  it "cannot have a blank zip" do
    address.zip = ""
    expect(address).not_to be_valid
  end

  it "cannot have a blank state" do
    address.state = ""
    expect(address).not_to be_valid
  end

  it "cannot have a blank street_number" do
    address.street_number = ""
    expect(address).not_to be_valid
  end

  it "cannot have a blank street" do
    address.street = ""
    expect(address).not_to be_valid
  end

  it "cannot have a blank city" do
    address.city = ""
    expect(address).not_to be_valid
  end

  it "state is only 2 letters" do
    address.state = "lksjdaslkdalkjshdlkasjdh"
    expect(address).not_to be_valid
    address.state = "l"
    expect(address).not_to be_valid
    address.state = "14"
    expect(address).not_to be_valid
    address.state = "DC"
    expect(address).to be_valid
  end

  it "zip is only 5 digits" do
    address.zip = "123456"
    expect(address).not_to be_valid
    address.zip = "1234"
    expect(address).not_to be_valid
    address.zip = "1234A"
    expect(address).not_to be_valid
    address.zip = "12345"
    expect(address).to be_valid
  end
end
