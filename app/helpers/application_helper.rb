module ApplicationHelper

  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def shortUrl(url)
    "#{root_url}urls/#{url.id}"
  end

end
