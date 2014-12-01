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
end
