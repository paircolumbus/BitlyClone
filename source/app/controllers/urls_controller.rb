class UrlsController < ApplicationController
  before_action :set_url, only: [:show]

  def index
    if Url.all.size == 0
      flash.now[:danger] = "There aren't any yet. Why don't you start us off?"
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
    if check_url? && @url.save
      redirect_to urls_path
    else
      flash.now[:danger] = "Something went wrong with your URL. . ."
      render 'new'
    end
  end

  def short_url
    @url = Url.find_by(short_url: params[:short_url])
    @url.click_count += 1
    @url.save
    redirect_to @url.long_url
  end

  def show

  end

  def home
  end

  private
    def url_params
      params.require(:url).permit(:long_url)
    end

    def check_url?
      url = URI.parse(@url.long_url)
      url.is_a?(URI::HTTP) && !url.host.nil?
    end

    def set_url
      @url = Url.find_by(params[:id])
    end
end
