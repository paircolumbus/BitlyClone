class UrlsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]


  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.user = current_user
    if @url.save
      flash[:success] = "Shortened!"
      render 'land'
    else
      flash[:danger] = @url.errors.full_messages.first
      render 'new'
    end
  end

  def land
    @url = Url.find(params[:id])
  end

  def index
    @urls = Url.paginate(page: params[:page])
    @pageTitle = "List of Links"
  end

  def myIndex
    @urls = Url.where(user: current_user).paginate(page: params[:page])
    @pageTitle = "My Links"
    render 'index'
  end

  def show
    @url = Url.find(params[:id])
    redirect_to @url.longText
  end

  def edit
    @url = Url.find(params[:id])
  end

  def update
    @url = Url.find(params[:id])
    if @url.update_attributes(url_params)
      flash.now[:success] = "Changes saved."
      render 'land'
    else
      flash[:danger] = @url.errors.full_messages.first
      render 'edit'
    end
  end

  def destroy
    @url = Url.find(params[:id]).destroy
    flash[:success] = "Link deleted"
    redirect_to urls_url
  end

  private
    def url_params
      params.require(:url).permit(:longText)
    end

    def logged_in_user
      if current_user == nil
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = Url.find(params[:id]).user
      if current_user != @user
        flash[:danger] = "You can only update your own links."
        redirect_to root_url
      end
    end

end
