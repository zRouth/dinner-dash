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
  end