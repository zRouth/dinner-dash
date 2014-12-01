require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:user) do
    User.create(email: 'LOL@LOL.LOL', full_name: 'yooser',
                password: 'password', password_confirmation: 'password')
  end

  it "belongs to a user" do
    order = user.orders.create
    expect(order.user.id).to eq user.id
  end

  it "defaults to pickup" do
    order = Order.new
    expect(order.pickup?).to eq true
    expect(order.delivery?).to eq false
  end

  it "can be marked for delivery" do
    order = Order.new(delivery: true)
    expect(order.delivery?).to eq true
    expect(order.pickup?).to eq false
  end

  it "can have an address" do
    order = Order.create(delivery: true)
    address = Address.create(street_number: "1231231", street: "fake-road", city: "mars" , state: "CO" , zip: "10000", order_id: order.id)
    expect(order.address).to eq address
    expect(address.order).to eq order
  end
end
