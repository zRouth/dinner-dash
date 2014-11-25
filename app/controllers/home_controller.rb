class HomeController < ApplicationController
  def index
  end

  def menu
    @cart = session[:cart]
    @menu_items = MenuItem.all
    @categories = Category.all
  end

end
