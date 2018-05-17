class UrlsController < ApplicationController
  before_action :set_url, only: [:show]

  def index
    if Url.all.size == 0
      flash[:danger] = "There aren't any yet. Why don't you start us off?"
      render 'home'
    else
      @urls = Url.all
    end
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    #if check_url?
      #flash.now[:danger] = "Check your URL. . ."
      #render 'new'
    #else
      #@url.save
      #flash.now[:success] = "Your URL is SHORT"
      #redirect_to new_url_path(@url)
    #end
    if @url.save
      redirect_to urls_path
    else
      flash.now[:danger] = "Something went wrong with your URL. . ."
      render 'new'
    end
  end

  def show
    @url.click_count += 1
    @url.save
    redirect_to "http://#{@url.long_url}"
  end

  def home
  end

  private
  def url_params
    params.require(:url).permit(:long_url)
  end

  def check_url?
    @url.long_url.exclude?(".com") && @url.long_url.exclude?(".org") && @url.long_url.exclude?(".net")
  end

  def set_url
    @url = Url.find_by(short_url: params[:short_url])
  end
end
