class SessionsController < ApplicationController
  before_filter :authenticate_user

  def index
    if logged_in?
      redirect_to user_path(session[:user_id])
    else
      redirect_to session_path 
    end
  end

  def new
    render :new
  end

  def create
  end

  def destroy
    session.clear
    redirect root_url 
  end

  private

  def user_params
  end

end
