class CartController < ApplicationController
  def destroy
    session[:cart] = {}
    redirect_to :back
  end

  def update
    session[:cart] ||= {}
    amount = params[:menu_item][:amount].to_i
    session[:cart][params[:id]] = amount < 0 ? 0 : amount
    redirect_to :back
  end
end
