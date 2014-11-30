class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  helper_method :current_user, :require_admin

#Josh recommended that we load cart in application controller
  # before_filter :load_cart
  #
  # def load_cart
  #   @cart = session[:cart] || {}
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    unless current_user && current_user.is_admin?
      redirect_to root_path, notice: "NO SOUP FOR YOU!"
    end
  end
end
