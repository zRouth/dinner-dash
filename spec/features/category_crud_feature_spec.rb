require "rails_helper"

feature "categories things" do
  let :admin do
    User.create full_name: 'Admin The Man', email: 'the_admin@example.com', password: 'p4ssw0rd', password_confirmation: 'p4ssw0rd', admin: true
  end

  before(:each) do
    visit '/login'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Login'
  end

  scenario "User creates a new category" do
    visit "/categories"
    new_category = "I created a category"
    expect(page.body).not_to include new_category
    click_link_or_button "New"
    fill_in "category[title]", with: new_category
    click_link_or_button "Create Category"
    expect(page.body).to include new_category
  end

  scenario "User deletes a category" do
    new_category = "I created a category"
    Category.create(title: new_category)

    visit "/categories"
    expect(page.body).to include new_category
    click_link_or_button "Title: #{new_category}"
    click_link_or_button "Delete"

    expect(page.body).not_to include new_category
  end

  scenario "User edits a category" do
    new_category = "I created a category"
    Category.create(title: new_category)

    visit "/categories"
    expect(page.body).to include new_category
    click_link_or_button "Title: #{new_category}"
    click_link_or_button "Edit"

    fill_in "category[title]", with: "I edited a category"
    click_link_or_button "Update Category"
    expect(page.body).to include "I edited a category"
    expect(page.body).not_to include new_category
  end
end
