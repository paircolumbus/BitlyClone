class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_name(params["/login"][:name])
    if user && user.authenticate(params["/login"][:password])
      reset_session
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "Welcome #{user.name}!"
    else
      redirect_to login_path
      flash[:danger] = "Login unsuccessful."
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
