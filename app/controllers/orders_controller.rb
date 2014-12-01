class OrdersController < ApplicationController
  def index
    @orders = Order.all.includes(:user, order_menu_items: :menu_item)
  end
end
