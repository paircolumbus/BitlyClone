class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session[:user_id]
  end

  def current_user
    @user = session[:user_id] ? User.find(session[:user_id]) : User.new 
  end

  def authenticate_user!
    redirect_to root_url unless logged_in?
  end
end
