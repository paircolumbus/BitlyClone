class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    if params[:id].start_with?("!")
        @url = Url.find_by(:short_url => "http://localhost:3000/urls/#{params[:id]}")
        @url.click_count += 1
        redirect_to @url[:long_url]
    else 
      @url = Url.find(params[:id])
      url_path(@url)
    end
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
