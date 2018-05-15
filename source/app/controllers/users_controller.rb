class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to urls_path
    else
      flash[:error] = @url.errors.full_messages
      redirect_to new_user_path(@user)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.id == session[:user_id]
      render "show"
    else
      redirect_to log_in_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
