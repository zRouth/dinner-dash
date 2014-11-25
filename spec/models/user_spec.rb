require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:user) do
    User.new(email: 'email@gmail.com', full_name: 'zach man', user_name: nil,
              password: 'password', password_confirmation: 'password')
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without a unique email' do
    user.save
    invalid_user = user.dup
    invalid_user.email = user.email.upcase
    expect(invalid_user).not_to be_valid
  end

  it 'is invalid without a full name' do
    user.full_name = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without a user name' do
    expect(user).to be_valid
  end

  it 'is invalid with a user name with only 1 character' do
    user.user_name = 'z'
    expect(user).to_not be_valid
  end

  it 'is invalid with a user name longer than 32 characters' do
    user.user_name = ('z' * 33)
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is not an admin by default' do
    expect(user.admin).to be false
  end

  it 'responds to #is_admin?' do
    expect(user.is_admin?).to be false
  end

  it 'can make a user an admin' do
    user.admin = true
    expect(user.is_admin?).to be true
  end

end
