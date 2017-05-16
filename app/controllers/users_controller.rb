class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      flash[:danger] = @user.errors.full_messages.first
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Changes saved."
      redirect_to @user
    else
      flash[:danger] = @user.errors.full_messages.first
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.order(:last_name).paginate(page: params[:page], per_page: 30)
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      if current_user == nil
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      if current_user != @user
        flash[:danger] = "You can only update your own profile."
        redirect_to root_url
      end
    end

    def admin_user
      if !current_user.admin?
        flash[:danger] = "Only administrators can delete users"
        redirect_to root_url
      end
    end
end
