class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to url_path(@url)
    else
      redirect_to root_path
    end
  end


  private
  def url_params
    params.require(:url).permit(:long)
  end
end
