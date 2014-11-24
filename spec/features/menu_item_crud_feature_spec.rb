require "rails_helper"

feature "menu_items things" do
  xscenario "User creates a new menu_item" do
    visit "/menu_items"
    new_menu_item = {title: "I created a menu_item", description: "full of yummy", price: 10000}
    expect(page.body).not_to include new_menu_item[:title]
    click_link_or_button "New"
    fill_in "menu_item[title]", with: new_menu_item[:title]
    fill_in "menu_item[description]", with: new_menu_item[:description]
    fill_in "menu_item[price]", with: new_menu_item[:price]
    click_link_or_button "Create menu_item"
    expect(page.body).to include new_menu_item[:title]
  end

  xscenario "User deletes a menu_item" do
    visit "/menu_items"
    new_menu_item = {title: "I created a menu_item", description: "full of yummy", price: 10000}
    expect(page.body).not_to include new_menu_item[:title]
    MenuItem.create new_menu_item

    expect(page.body).to include new_menu_item[:title]
    click_link_or_button "Title: #{new_menu_item[:title]}"
    click_link_or_button "Delete"

    expect(page.body).not_to include new_menu_item[:title]
  end

  xscenario "User edits a menu_item" do
    visit "/menu_items"
    new_menu_item = {title: "I created a menu_item", description: "full of yummy", price: 10000}
    MenuItem.create new_menu_item

    expect(page.body).to include new_menu_item[:title]
    click_link_or_button "Title: #{new_menu_item[:title]}"
    click_link_or_button "Edit"

    fill_in "menu_item[title]", with: "I edited a menu_item"
    click_link_or_button "Update menu_item"
    expect(page.body).to include "I edited a menu_item"
    expect(page.body).not_to include new_menu_item[:title]
  end
end