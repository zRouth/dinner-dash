require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:user) do
    User.new(email: 'email@gmail.com', full_name: 'zach man', user_name: 'zach',
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
    expect(invalid_user.save).to be false
  end

  it 'is invalid without a full name' do
    user.full_name = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without a user name' do
    user.user_name = nil
    expect(user).not_to be_valid
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
