require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'is invalid without an email' do
    user = User.new(email: nil)
    expect(user).not_to be_valid
  end

  it 'is invalid without a full name' do
    user = User.new(full_name: nil)
    expect(user).not_to be_valid
  end

  it 'is invalid without a user name' do
    user = User.new(user_name: nil)
    expect(user).not_to be_valid
  end

  it 'is invalid without a password' do
    user = User.new(password: nil)
    expect(user).not_to be_valid
  end

end
