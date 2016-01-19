class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Account created successfully!"
      redirect_to root_path
    else
      flash.now[:danger] = "Account could not be created."
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
