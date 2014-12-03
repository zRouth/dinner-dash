class Order < ActiveRecord::Base
  belongs_to :user
  has_one :address
  has_many :order_menu_items
  has_many :menu_items, through: :order_menu_items

  scope :for_user, ->(user) { where user: user }

  def pickup?
    !delivery
  end

  def delivery?
    delivery
  end

  def total_cost
    order_menu_items.reduce(0) do |sum, order_menu_item|
    sum + order_menu_item.cost
    end
  end
end
