require 'rails_helper'

describe 'Application authorizaiton' do

  context 'when not logged in' do
    before(:each) do
      visit root_path
    end

    it 'cannot access the users index page' do
      user = FactoryGirl.create(:user)
      visit users_path
      expect(page).to have_content('NO SOUP FOR YOU!')
      expect(page.current_path).to_not eq users_path
    end

    it 'cannot access the categories index page' do
      visit categories_path
      expect(page).to have_content('NO SOUP FOR YOU!')
      expect(page.current_path).to_not eq categories_path
    end

    it 'cannot access the menu_items index page' do
      visit menu_items_path
      expect(page).to have_content('NO SOUP FOR YOU!')
      expect(page.current_path).to_not eq menu_items_path
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
