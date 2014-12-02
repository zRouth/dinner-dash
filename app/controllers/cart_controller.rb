class CartController < ApplicationController
  #Josh recommended that we load cart in application controller (see app_contro)
  #Rachel recommended that we not store the menu item name in session hash:
    #only menu item id and quantity in session hash

  def destroy
    session[:cart] = {}
    redirect_to :back
  end

  def show
    @cart = session[:cart]
    @items_ordered = @cart.map do |id, quantity|
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
