module UsersHelper
  def register_path
    '/register'
  end

  def profile_path
    '/profile'
  end

  alias :new_user_path :register_path
end
