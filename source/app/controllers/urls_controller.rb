class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def create
    url = Url.new(url_params)
    url.save
    redirect_to urls_path
  end

  def show
    url = Url.find(params[:id])
    redirect_to url.long_url
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
