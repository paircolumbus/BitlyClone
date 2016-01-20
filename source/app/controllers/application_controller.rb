class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :admin_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    if !current_user
      flash[:danger] = "You are not logged in."
      redirect_to root_path
    end
  end

  def admin_user
    if !current_user || !current_user.admin?
      flash[:danger] = "You do not have the credentials to view this page."
      redirect_to root_path
    end
  end

end
