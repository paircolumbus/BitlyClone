class UsersController < ApplicationController
  before_action :current_user
  before_action :authenticate_user!, except: [:new, :create]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      redirect_to urls_path
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email_address,
      :password,
      :password_confirmation,
    )
  end
end
