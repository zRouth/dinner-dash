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
    if !deliv || address.save
      current_user.orders.create(delivery: deliv) do |order|
        order.address = address if deliv
        session[:cart].each do |menu_item_id, total|
          order.order_menu_items.build(menu_item_id: menu_item_id, quantity: total)
        end
      end
      session[:cart] = {}
    end
  end

  def my_orders
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
    @state_abbrs = [ "AA", "AE", "AK", "AL", "AP", "AR", "AS", "AZ", "CA", "CO", "CT",
      "DC", "DE", "FL", "FM", "GA", "GU", "HI", "IA", "ID", "IL", "IN",
      "KS", "KY", "LA", "MA", "MD", "ME", "MH", "MI", "MN", "MO", "MP",
      "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH",
      "OK", "OR", "PA", "PR", "PW", "RI", "SC", "SD", "TN", "TX", "UT",
      "VA", "VI", "VT", "WA", "WI", "WV", "WY"]
  end

  def show
    @order = Order.includes(:user, order_menu_items: :menu_item).find(params[:id])
  end

  def update
    order = Order.includes(:order_menu_items).find(params[:id])
    order.update_attributes status: params[:order][:status]
    params[:menu_item].each do |menu_item_id, quantity|
      order_menu_item = order.order_menu_items.find_by(menu_item_id: menu_item_id)
      if quantity.to_i > 0
        order_menu_item.update_attributes quantity: quantity
      else
        order_menu_item.delete
      end
    end
    redirect_to :back
  end

  private

  def order_params
    params.require(:order).permit(:address, :delivery)
  end

  def address_params
    params.require(:address).permit(:street_number, :street, :city, :state, :zip)
  end
end
