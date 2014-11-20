require 'rails_helper'

describe "MenuItems and Categories link up" do
  let(:menu_item) { MenuItem.create(title: "tuna sushi ro", description: "yummy", price: 1000) }
  let(:menu_item2) { MenuItem.create(title: "another tuna item", description: "yum", price: 1) }
  let(:category) { Category.create(title: "tuna") }
  let(:category2) { Category.create(title: "sushi") }

  it "MenuItem can have a Category and vice versa" do
    menu_item.categories << category
    expect(menu_item.categories).to include category
    expect(category.menu_items).to include menu_item
  end

  it "MenuItem can have many Categories and vice versa" do
    category.menu_items << menu_item
    category.menu_items << menu_item2
    category2.menu_items << menu_item

    expect(category.menu_items).to include menu_item
    expect(category.menu_items).to include menu_item2
    expect(category2.menu_items).to include menu_item

    expect(menu_item.categories).to include category
    expect(menu_item.categories).to include category2
    expect(menu_item2.categories).to include category
  end

  it "Can remove menu_items and categories" do
    category.menu_items << menu_item
    category.menu_items << menu_item2
    expect(category.menu_items).to include menu_item2

    category.menu_items -= [menu_item2]

    expect(category.menu_items).to include menu_item
    expect(menu_item.categories).to include category
    expect(category.menu_items).not_to include menu_item2
    expect(menu_item2.categories).not_to include category
  end
end
