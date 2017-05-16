class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "You are now logged in"
      redirect_to urls_path
    else
      flash.now[:danger] = "User could not be authenticated"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to root_url
  end
end
