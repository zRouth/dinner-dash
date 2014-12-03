class OrdersController < ApplicationController
  def index
    @orders = Order.all.includes(:user, order_menu_items: :menu_item)
  end

  def create
    unless current_user
      redirect_to :back, flash[:notice] = "Please log in or sign up to view this order"
    else
      current_user.orders.create do |order|
        session[:cart].each do |menu_item_id, total|
          order.order_menu_ites.build(menu_item_id: menu_item_id, quantity: total)
        end
      end
    end
  end
end
