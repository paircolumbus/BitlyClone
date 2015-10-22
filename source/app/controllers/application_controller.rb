#
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do |controller|
    redirect_to new_session_url if
      !session.key?(:user_id) && (
        controller.is_a?(UsersController) ||(
          controller.is_a?(UrlsController) &&
            controller.action_name != 'short'
        )
      )
  end
end
