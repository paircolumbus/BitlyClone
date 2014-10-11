class SessionsController < ApplicationController
  before_action :current_user
  before_action :authenticate_user!, except: [:index, :create]

  def index
    if logged_in?
      redirect_to user_path(session[:user_id])
    else
      render :index
    end
  end

  def create
    @user = User.find_by_email(user_params[:email])
    if @user && @user.authenticate(user_params[:password]) 
      session[:user_id] = @user.id
      redirect_to user_path(@user.id) 
    else
      redirect_to root_url
    end
  end

  def destroy
    session.clear
    redirect_to root_url 
  end

  private

  def user_params
    params.require(:user).permit(
      :email_address,
      :password,
      :password_confirmation,
    )
  end

end
