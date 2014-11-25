require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'user authentication', type: :feature do
  it 'creates a user' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'chandra123@gmail.com'
    fill_in 'Full name', with: 'Chandra1'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'
    expect(page).to have_content("User created")
  end

  context 'when not logged in' do
    before(:each) do
      visit root_path
    end

    it 'has a Sign in link' do
      expect(page).to have_link('Sign in', href: login_path)
    end

    it 'has a Sign up link' do
      expect(page).to have_link('Sign up', href = "/users/new")
    end

    it 'does not have a logout link' do
      expect(page).to_not have_link('Logout')
    end
  end

  context 'when logged in' do

    it 'logs in an existing user' do
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      expect(page).to have_content('Logout')
    end

    it 'does not have a login link' do
      expect(page).to_not have_link('Login')
    end
  end

end