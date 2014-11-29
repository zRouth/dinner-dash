class MenuItemsController < ApplicationController
  before_filter :set_menu_item, only: [:edit, :show, :update]

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
  end

  def show
    redirect_to menu_items_path unless @menu_item
  end

  def update
    @menu_item.update(correct_params)
    redirect_to menu_items_path(@menu_item)
  end

  def destroy
    menu_item = MenuItem.find(params[:id])
    menu_item.delete if menu_item
    redirect_to menu_items_path
  end

  def correct_params
    params.require(:menu_item).permit(:title, :description, :price, :image)
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end
end
