require 'rails_helper'

RSpec.describe OrderMenuItem, :type => :model do
  let(:menu_item) { MenuItem.create(title: "tuna sushi ro", description: "yummy", price: 1000) }
  let(:menu_item2) { MenuItem.create(title: "another tuna item", description: "yum", price: 1) }
  let(:order) { Order.create }
  let(:order2) { Order.create }

  it "MenuItem can have a Order and vice versa" do
    menu_item.orders << order
    expect(menu_item.orders).to include order
    expect(order.menu_items).to include menu_item
  end

  it "MenuItem can have many Orders and vice versa" do
    order.menu_items << menu_item
    order.menu_items << menu_item2
    order2.menu_items << menu_item

    expect(order.menu_items).to include menu_item
    expect(order.menu_items).to include menu_item2
    expect(order2.menu_items).to include menu_item

    expect(menu_item.orders).to include order
    expect(menu_item.orders).to include order2
    expect(menu_item2.orders).to include order
  end

  it "Can remove menu_items and orders" do
    order.menu_items << menu_item
    order.menu_items << menu_item2
    expect(order.menu_items).to include menu_item2

    order.menu_items.delete menu_item2.id

    expect(order.menu_items).to include menu_item
    expect(menu_item.orders).to include order
    expect(order.menu_items).not_to include menu_item2
    expect(menu_item2.orders).not_to include order
  end

end
