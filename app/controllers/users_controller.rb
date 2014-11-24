class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:show]
  before_action :require_admin, only: [:index, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:notice] = "User created"
      session[:email] = @user.id
      redirect_to :users
    else
      flash.new[:notice] = "User could not be created"
      render.new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :user_name, :password, :password_confirmation)
  end
end
