require 'rails_helper'

RSpec.describe Category, :type => :model do

  let(:category) { Category.new(title: 'sushi') }

  it 'is valid' do
    expect(category).to be_valid
  end

  it 'is not valid with empty string or nil title' do
    category.title = ""
    expect(category).to_not be_valid
    category.title = nil
    expect(category).to_not be_valid
  end
end
