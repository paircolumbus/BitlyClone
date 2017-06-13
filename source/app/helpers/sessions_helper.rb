module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_auth!
    unless logged_in?
      flash[:danger] = 'You must sign in to view that page.'
      redirect_to login_path
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def login_path
    '/login'
  end

  def logout_path
    '/logout'
  end

  alias :new_session_path :login_path
end
