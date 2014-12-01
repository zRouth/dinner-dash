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
      [MenuItem.find(id).title, quantity]
    end
  end

  def update
    session[:cart] ||= {}
    amount = params[:menu_item][:amount].to_i
    session[:cart][params[:id]] = amount < 0 ? 0 : amount
    redirect_to :back
  end
end
