class Admin::MenuItemsController < AdminController
  before_filter :set_menu_item, only: [:edit, :show, :update]

  def index
    @menu_items = MenuItem.all
  end

  def create
    item = MenuItem.create correct_params
    item.category_ids = params[:category].keys.map(&:to_i) if params[:category]
    redirect_to menu_items_path
  end

  def new
    @categories = Category.all
    @menu_item = MenuItem.new
  end

  def edit
    @categories = Category.all
    @menu_item = MenuItem.includes(:categories).find(params[:id])
  end

  def show
    @menu_item = MenuItem.find(params[:id])
    redirect_to menu_items_path unless @menu_item
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    @menu_item.update(correct_params)
    @menu_item.category_ids = params[:category].keys.map(&:to_i) if params[:category]
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
