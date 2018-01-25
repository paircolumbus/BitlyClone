class UrlsController < ApplicationController
  def create
    @url = Url.new(urls_params)

    if @url.save
      redirect_to urls_path
    else
      render 'new'
    end
  end

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def route_me
    url = Url.find_by_short_url params[:short_url]

    if url.nil?
      redirect_to root_path
    else
      redirect_to url.long_url
    end


  end

  private

  def urls_params
    params.require(:url).permit(:long_url)
  end

end
