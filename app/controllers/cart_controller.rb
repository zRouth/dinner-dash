class CartController < ApplicationController
  def destroy
    session[:cart] = {}
    redirect_to :back
  end

  def show
    @items_ordered = session[:cart].map do |id, quantity|
      menu_item = MenuItem.find(id)
      {id: menu_item.id, name: menu_item.title, quantity: quantity, price: menu_item.price}
    end
    @total_cost = session[:cart].map { |id, quant| MenuItem.find(id).price * quant }.reduce(0,:+)
  end

  def update
    if params[:menu_item]
      amount = params[:menu_item][:amount].to_i
    else
      amount = (session[:cart][params[:id]] || 0) + 1
    end
    session[:cart][params[:id]] = amount unless amount < 0
    redirect_to :back
  end
end
