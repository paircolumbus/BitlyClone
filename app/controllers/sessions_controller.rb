class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to mylinks_url
    else
      flash[:danger] = "Email/password mismatch"
      redirect_to login_path
    end
  end

  def destroy
    if current_user != nil
      log_out
    end
    redirect_to root_url
  end
end
