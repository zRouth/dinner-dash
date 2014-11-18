require 'rails_helper'

RSpec.describe MenuItem, :type => :model do

  let(:menu_item) { MenuItem.new(title: "tuna sushi ro", description: "yummy", price: 1000) }

  it 'is valid' do
    expect(menu_item).to be_valid
  end

  it 'is not valid with empty string or nil title' do
    menu_item.title = ""
    expect(menu_item).to_not be_valid
    menu_item.title = nil
    expect(menu_item).to_not be_valid
  end

  it 'is not valid with empty string or nil description' do
    menu_item.description = ""
    expect(menu_item).to_not be_valid
    menu_item.description = nil
    expect(menu_item).to_not be_valid
  end

  it 'is not valid with negative, 0, float value, or nil price' do
    menu_item.price = -1
    expect(menu_item).to_not be_valid
    menu_item.price = 0
    expect(menu_item).to_not be_valid
    menu_item.price = nil
    expect(menu_item).to_not be_valid
    menu_item.price = 0.01
    expect(menu_item).to_not be_valid
  end
end
