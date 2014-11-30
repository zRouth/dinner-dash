require "rails_helper"

feature "menu_items things" do
  let :admin do
    User.create full_name: 'Admin The Man', email: 'the_admin@example.com', password: 'p4ssw0rd', password_confirmation: 'p4ssw0rd', admin: true
  end

  before(:each) do
    visit '/login'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Login'
  end

  scenario "User creates a new menu_item" do
    visit "/menu_items"
    new_menu_item = {title: "I created a menu_item", description: "full of yummy", price: 10000}
    expect(page.body).not_to include new_menu_item[:title]
    click_link_or_button "New"
    fill_in "menu_item[title]", with: new_menu_item[:title]
    fill_in "menu_item[description]", with: new_menu_item[:description]
    fill_in "menu_item[price]", with: new_menu_item[:price]
    click_link_or_button "Create Menu item"
    expect(page.body).to include new_menu_item[:title]
  end

  scenario "User deletes a menu_item" do
    visit "/menu_items"
    new_menu_item = {title: "I created a menu_item", description: "full of yummy", price: 10000}
    expect(page.body).not_to include new_menu_item[:title]
    MenuItem.create new_menu_item
    visit "/menu_items"
    expect(page.body).to include new_menu_item[:title]
    click_link_or_button "Title: #{new_menu_item[:title]}"
    click_link_or_button "Delete"

    expect(page.body).not_to include new_menu_item[:title]
  end

  scenario "User edits a menu_item" do
    visit "/menu_items"
    new_menu_item = {title: "I created a menu_item", description: "full of yummy", price: 10000}
    MenuItem.create new_menu_item
    visit "/menu_items"
    expect(page.body).to include new_menu_item[:title]
    click_link_or_button "Title: #{new_menu_item[:title]}"
    click_link_or_button "Edit"

    fill_in "menu_item[title]", with: "I edited a menu_item"
    click_link_or_button "Update Menu item"
    expect(page.body).to include "I edited a menu_item"
    expect(page.body).not_to include new_menu_item[:title]
  end
end
