class MenuItem < ActiveRecord::Base
  has_many :menu_item_categories
  has_many :categories, through: :menu_item_categories
end
