class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])

    if user
      session[:user_id] = user.id
      parsed_cart = JSON.parse(user.cart.empty? ? "{}" : user.cart)
      session[:cart] = parsed_cart unless parsed_cart.empty?
      redirect_to root_path, notice: "Welcome to DinnerDash, #{user.full_name}."
    else
      redirect_to login_path, notice: "We could not log you in. Please try again."
    end
  end

  def destroy
    session.clear

    redirect_to root_path, notice: "You are logged out."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
