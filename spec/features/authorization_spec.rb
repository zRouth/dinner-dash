require 'rails_helper'

describe 'Application authorizaiton' do

  context 'when not logged in' do
    before(:each) do
      visit root_path
    end

    it 'cannot access a restriced page' do
      user = FactoryGirl.create(:user)
      visit users_path
      expect(page).to have_content('NO SOUP FOR YOU!')
    end
  end

  # context 'when logged in' do
  #   user = FactoryGirl.create(:admin)
  #   visit login_path
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   click_button 'Login'
  #   visit users_path
  #   expect(page).to have_content('All users')
  # end

end
