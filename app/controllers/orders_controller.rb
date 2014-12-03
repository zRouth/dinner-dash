class OrdersController < ApplicationController
  def index
    @orders = Order.all.includes(:user, order_menu_items: :menu_item)
  end

  def create
    unless current_user
      redirect_to :back, notice: "Please log in or sign up to place an order"
    else
      create_order
      redirect_to "/my_orders"
    end
  end

  def create_order
    current_user.orders.create do |order|
      session[:cart].each do |menu_item_id, total|
        order.order_menu_items.build(menu_item_id: menu_item_id, quantity: total)
      end
    end
    session[:cart] = {}
  end

  def show
    unless current_user
      redirect_to :back, notice: "Please log in to view your orders"
    else
      @orders = Order.for_user(current_user)
    end
  end

  def new
    @total_cost = session[:cart].map { |id, quant| MenuItem.find(id).price * quant }.reduce(0,:+)
    @items_ordered = session[:cart].map do |id, quantity|
      menu_item = MenuItem.find(id)
      {price: menu_item.price, name: menu_item.title, quantity: quantity}
    end
  end
end
