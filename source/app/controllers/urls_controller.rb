class UrlsController < ApplicationController

  def short
    @url = Url.find_by(:short_url => params[:id])
    @url.increment(:click_count)
    redirect_to @url[:long_url]
  end

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
    url_path(@url)
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
        redirect_to url_path(@url)
    else
      render 'new' 
    end
  end

  private
    def url_params
      params.require(:url).permit(:long_url)
    end
end
