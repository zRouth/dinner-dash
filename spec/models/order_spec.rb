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

  it "is marked for delivery" do
    order = Order.new(delivery: true)
    expect(order.delivery?).to eq true
    expect(order.pickup?).to eq false
  end
end
