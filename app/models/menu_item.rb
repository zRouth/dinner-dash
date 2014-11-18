class MenuItem < ActiveRecord::Base
  has_many :menu_item_categories
  has_many :categories, through: :menu_item_categories
  validates :title, :description, exclusion: [""], presence: true
  validates :price, presence: true, numericality: { greater_than: 0, only_integer: true }
end
