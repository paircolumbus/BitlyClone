require 'pry'

class UrlsController < ApplicationController

  before_action :get_url, only: [:show, :destroy]
  before_action :logged_in_user, only: [:edit, :update, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @urls = Url.all
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      flash[:success] = 'Url was successfully created'
      redirect_to urls_path
    else
      flash[:failure] = 'Url could not be created'
      render 'new'
    end
  end

  def new
    @url = Url.new
  end

  def edit
    @url = get_url
  end

  def update
    @url = get_url
    if @url.update(url_params)
      flash[:success] = "Url successfully updated"
      redirect_to urls_path
    else
      render 'edit'
    end
  end

  def destroy
    @url.destroy
    redirect_to_index
  end

  def expand_link
    @url = Url.find_by unique_key: params[:unique_key]
    redirect_to_url
  end

  def redirect_to_index
    redirect_to urls_path
  end

  def redirect_to_url
    @url.click_count += 1
    @url.save
    redirect_to @url.address
  end

  def get_url
    @url = Url.find(params[:id])
  end

  private

    def url_params
      params.require(:url).permit(:address)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

    def correct_user
      # TODO Make this reference the user attached to the Url
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
