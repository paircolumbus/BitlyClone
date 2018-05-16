require 'net/http'

class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def create
    url = Url.new(url_params)

    if !url.save
      flash[:error] = 'Invalid URL'
    end

    redirect_to urls_path
  end

  def show
    url = Url.find(params[:id])
    url.click_count += 1
    url.save
    redirect_to url.long_url
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
