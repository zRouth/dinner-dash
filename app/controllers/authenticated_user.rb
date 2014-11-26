class UsersController < ApplicationController
  before_action :require_admin, only: [:index]

  def index
    require_admin
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to :back, notice: "User created. Please log in."
    else
      flash.now[:notice] = "User could not be created."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_admin
    unless current_user && current_user.is_admin?
      redirect_to root_path, notice: "You don't know me."
    end
  end

end
