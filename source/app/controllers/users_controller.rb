class UsersController < ApplicationController
  before_filter :current_user, only: [:show, :edit, :update]
  before_filter :logged_in?, only: [:show, :edit, :update]

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
    @user_links = current_user.links
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
