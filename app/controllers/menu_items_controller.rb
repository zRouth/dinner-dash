class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
  end

  def create
    MenuItem.create correct_params
    redirect_to menu_items_path
  end

  def new
    @menu_item = MenuItem.new
  end

  def edit
    @menu_item = MenuItem.find_by_id(params[:id])
  end

  def show
  end

  def update
  end

  def update
  end

  def destroy
  end

  def correct_params
    params.require(:menu_item).permit(:title, :description, :price)
  end
end
