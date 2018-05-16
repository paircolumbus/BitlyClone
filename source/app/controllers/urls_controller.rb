class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
  end

  def show

  end

  private
  def url_params
    params.require(:recipe).permit(:long_url)
  end

end
