class Order < ActiveRecord::Base
  belongs_to :user
  has_one :address
  has_many :order_menu_items
  has_many :menu_items, through: :order_menu_items

  def pickup?
    !delivery
  end

  def delivery?
    delivery
  end
end
