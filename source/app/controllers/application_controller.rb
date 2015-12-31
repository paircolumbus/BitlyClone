class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def s
    @url = Url.find_by(shortened: params[:shortened])
    redirect_to @url.unshortened
    @url.increment_count
  end
end
