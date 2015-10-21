require 'User'

class SessionsController < ApplicationController
  before_action :check_session, only: [:new, :create]
  WRONG_CREDENTIALS = 'Wrong crendentials, please try again'
  GOOD_BYE = 'You have been logged out. Good bye'

  # GET /sessions
  def index
    redirect_to new_session_url
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # POST /sessions
  def create
    user = User.find_by_login(
      session_params[:transient_login]
    )
    if user.nil? ||  BCrypt::Password.new(user.password) != session_params[:transient_password]
      redirect_to new_session_path, alert: WRONG_CREDENTIALS
    else
      session[:user_id] = user.id
      redirect_to urls_url
    end
  end

  # DELETE /sessions/1
  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: GOOD_BYE
  end

  private

  def check_session
    redirect_to urls_url if session.key?(:user_id)
  end

  def session_params
    params
      .require(:session)
      .permit(:transient_login, :transient_password, :user_id)
  end
end
