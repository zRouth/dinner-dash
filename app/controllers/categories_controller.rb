class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    Category.create correct_params
    redirect_to categories_path
  end

  def destroy
  end

  def correct_params
    params.require(:category).permit(:title)
  end
end
