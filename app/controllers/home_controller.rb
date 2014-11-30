class HomeController < ApplicationController
  def index
  end

  def menu
    @cart = session[:cart]
    @categories = Category.all.includes(:menu_items)
  end

  def yum
    @menu_item = MenuItem.find(params[:id])
  end

  def about
    @profiles = { alex: "dalexj", chandra: "chandracarney",
                  kate: "katelane", zach: "zRouth" }
  end
end
