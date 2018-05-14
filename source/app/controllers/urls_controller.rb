class UrlsController < ApplicationController

  def index
    @all = Url.all
  end

  def show
    if params[:id].start_with?("!")
        @url = Url.find_by(:short_url => "localhost:3000/urls/#{params[:id]}")
        redirect_to "http://#{@url[:long_url]}"
    else 
      @url = Url.find(params[:id])
      url_path(@url)
    end
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)
    redirect_to url_path(@url)
  end



  private
    def url_params
      params.require(:url).permit(:long_url)
    end
end
