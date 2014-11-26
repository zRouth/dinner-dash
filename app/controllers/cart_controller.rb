class CartController < ApplicationController
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
