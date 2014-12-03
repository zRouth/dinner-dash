require "rails_helper"

feature "orders work" do
  it "shows orders" do
    Category.create!(title: "Testing") do |cat|
      cat.menu_items.build title: "Tuna Poke", description: "a", price: 1
    end

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

  it "shows the total order price" do
  end
end
