class CartController < ApplicationController
  def destroy
    session[:cart] = {}
    redirect_to :back
  end

  def show
    @items_ordered = session[:cart].map do |id, quantity|
      menu_item = MenuItem.find(id)
      {id: menu_item.id, name: menu_item.title, quantity: quantity}
    end
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
