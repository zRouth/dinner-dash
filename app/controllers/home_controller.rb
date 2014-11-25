class HomeController < ApplicationController
  def index
  end

  def menu
    @cart = session[:cart]
    @categories = Category.all.includes(:menu_items)
  end

end
