require 'rails_helper'

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
    before(:each) { visit root_path }

    it 'has a Sign in link' do
      expect(page).to have_link('Sign in', href: login_path)
    end

    it 'has a Sign up link' do
      expect(page).to have_link('Sign up', href: new_user_path)
    end

    it 'does not have a logout link' do
      expect(page).to_not have_link('Logout')
    end
  end

  context 'when logged in' do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end

    it 'logs in an existing user' do
      expect(page).to have_content('Logout')
    end

    it 'does not have a login link' do
      expect(page).to_not have_link('Sign in')
    end

    it 'can logout' do
      click_link_or_button 'Logout'
      expect(page).to_not have_link 'Logout'
      expect(page).to have_link 'Sign in'
    end
  end
end
