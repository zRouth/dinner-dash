class MenuItem < ActiveRecord::Base
  has_many :menu_item_categories
  has_many :categories, through: :menu_item_categories
  has_attached_file :image, styles: {:icon => "40x95>"}
  validates :title, :description, exclusion: [""], presence: true
  validates :price, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
end
