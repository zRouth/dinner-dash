require "rails_helper"

feature "orders work" do
  before(:each) do
    Category.create!(title: "Testing") do |cat|
      cat.menu_items.build title: "Tuna Poke", description: "a", price: 1212
      cat.menu_items.build title: "Salmon", description: "b", price: 1010
    end
  end

  it "shows orders" do
    visit "/menu"
    within(".tuna-poke") do
      click_link_or_button "Add To Cart"
    end
    User.create(email: 'email@gmail.com', full_name: 'zach man',
                password: 'password', password_confirmation: 'password')
    visit '/login'
    fill_in 'Email', with: 'email@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).to have_content "Logout"

    click_link_or_button 'view-cart'
    click_link_or_button 'Checkout'
    click_link_or_button 'Place Order'

    visit '/my_orders'
    expect(page).to have_content "Tuna Poke"
  end

  it "doesn't show orders from another user" do
    alex = User.create(email: 'theman@gmail.com', full_name: 'alex man',
                password: 'password', password_confirmation: 'password')
    alex.orders.create do |order|
      order.menu_items << MenuItem.find_by(title: "Tuna Poke")
    end
    User.create(email: 'email@gmail.com', full_name: 'zach man',
                password: 'password', password_confirmation: 'password')
    visit '/login'
    fill_in 'Email', with: 'email@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).to have_content "Logout"

    visit '/my_orders'
    expect(page).to_not have_content "Tuna Poke"
  end

  it "shows the total order price" do
    visit "/menu"
    4.times do
      within(".tuna-poke") do
        click_link_or_button "Add To Cart"
      end
    end
    within(".salmon") do
      click_link_or_button "Add To Cart"
    end
    User.create(email: 'email@gmail.com', full_name: 'zach man',
    password: 'password', password_confirmation: 'password')
    visit '/login'
    fill_in 'Email', with: 'email@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).to have_content "Logout"

    click_link_or_button 'view-cart'
    click_link_or_button 'Checkout'
    expect(page).to have_content "$58.58"
    click_link_or_button 'Place Order'

    visit '/my_orders'
    expect(page).to have_content "$58.58"
  end

  it "shows the in-line total price for each menu item" do
    visit "/menu"
    4.times do
      within(".tuna-poke") do
        click_link_or_button "Add To Cart"
      end
    end
    3.times do
      within(".salmon") do
        click_link_or_button "Add To Cart"
      end
    end
    User.create(email: 'email@gmail.com', full_name: 'zach man',
                password: 'password', password_confirmation: 'password')
    visit '/login'
    fill_in 'Email', with: 'email@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).to have_content "Logout"

    click_link_or_button 'view-cart'
    click_link_or_button 'Checkout'
    expect(page).to have_content "$48.48"
    expect(page).to have_content "$30.30"
    click_link_or_button 'Place Order'

    visit '/my_orders'
    expect(page).to have_content "$48.48"
    expect(page).to have_content "$30.30"
    expect(page).to have_content "$78.78"

  end
end
