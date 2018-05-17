class UrlsController < ApplicationController

  def index
    if Url.all.count > 0
      @urls = Url.all
    end
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if validate_url?
      flash.now[:danger] = "Check your URL. . ."
      render 'new'
    else
      @url.save
      flash.now[:success] = "Your URL is SHORT"
      redirect_to url_path(@url)
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  private
  def url_params
    params.require(:url).permit(:long_url)
  end

  def validate_url?
    @url.long_url.exclude?(".com") && @url.long_url.exclude?(".org") && @url.long_url.exclude?(".net")
  end
end
