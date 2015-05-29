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
      redirect_to urls_url
    else
      render 'new'
    end
  end

  def show
    url = Url.find_by(short_path: params[:id])
    url.update(click_count: url.click_count + 1)
    redirect_to url.original_url
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
