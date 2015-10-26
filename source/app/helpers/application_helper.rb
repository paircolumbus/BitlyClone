module ApplicationHelper
  def logged_in_user
    redirect_to login_path and return if !logged_in?
  end
end
