class UsersController < ApplicationController
  before_action :require_auth!, only: [ :show, :profile ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:success] = 'Successfully registered user'
        format.html { redirect_to '/login', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    if current_user.id == params[:id]
      @user = current_user
    else
      flash[:danger] = 'You were not authorized to access that route. You may only access your own secret page.'
      redirect_to current_user
    end
  end

  def profile
    @user = current_user
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
