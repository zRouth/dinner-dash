class HomeController < ApplicationController
  def index
  end

  def menu
    @menu_items = MenuItem.all
    @categories = Category.all
  end

end
