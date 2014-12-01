class Admin::CategoriesController < AdminController

  def index
    @categories = Category.all
  end

  def create
    Category.create correct_params
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
    redirect_to categories_path unless @category
  end

  def update
    @category = Category.find(params[:id])
    @category.update(correct_params)
    redirect_to category_path(@category)
  end

  def destroy
    category = Category.find(params[:id])
    category.delete if category
    redirect_to categories_path
  end

  def correct_params
    params.require(:category).permit(:title)
  end
end
