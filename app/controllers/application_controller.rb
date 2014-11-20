class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "NO SOUP FOR YOU!"
    redirect_to root_url
  end

  helper_method :current_cart

  def current_user
    User.find(session[:cart_id])
  rescue
    user = User.create
    session[:user_id] = user.id
    cart
  end
end
