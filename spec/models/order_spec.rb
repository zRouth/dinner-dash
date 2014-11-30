require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:user) do
    User.create(email: 'LOL', full_name: 'yooser',
                password: 'password', password_confirmation: 'password')
  end

  it "belongs to a user" do
    order = user.orders.create
    expect(order.user.id).to eq user.id
  end
end
