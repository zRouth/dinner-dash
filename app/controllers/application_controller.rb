class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  helper_method :current_user, :require_admin

  before_action :clean_cart

  def clean_cart
    session[:cart] ||= {}
    session[:cart].delete_if { |menu_item_id, amt| !MenuItem.exists?(id: menu_item_id) || amt < 1 }
    if current_user
      current_user.cart = session[:cart].to_json
      current_user.save
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    unless current_user && current_user.is_admin?
      redirect_to root_path, notice: "NO SOUP FOR YOU!"
    end
  end
end
