module ApplicationHelper

  def current_user
    nil
  end

  def full_name
    "#{@user.first_name} #{@user.last_name}"
  end

end
