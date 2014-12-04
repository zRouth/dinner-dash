class OrdersController < ApplicationController
  before_action :require_admin, only: [:index]

  def index
    @orders = Order.all.includes(:user, order_menu_items: :menu_item)
  end

  def create
    unless current_user
      redirect_to :back, notice: "Please log in or sign up to place an order"
    else
      if create_order
        redirect_to "/my_orders"
      else
        redirect_to :back, notice: "Invalid address"
      end
    end
  end

  def create_order
    deliv = params[:order][:delivery] == "1"
    address = Address.new(address_params) if deliv
    if address.save || !deliv
      current_user.orders.create(delivery: deliv) do |order|
        order.address = address if deliv
        session[:cart].each do |menu_item_id, total|
          order.order_menu_items.build(menu_item_id: menu_item_id, quantity: total)
        end
      end
      session[:cart] = {}
    end
  end

  def show
    unless current_user
      redirect_to :back, notice: "Please log in to view your orders"
    else
      @orders = Order.for_user(current_user)
    end
  end

  def new
    @order = Order.new
    @total_cost = session[:cart].map { |id, quant| MenuItem.find(id).price * quant }.reduce(0,:+)
    @items_ordered = session[:cart].map do |id, quantity|
      menu_item = MenuItem.find(id)
      {price: menu_item.price, name: menu_item.title, quantity: quantity}
    end
  end

  private

  def order_params
    params.require(:order).permit(:address, :delivery)
  end

  def address_params
    params.require(:address).permit(:street_number, :street, :city, :state, :zip)
  end
end
