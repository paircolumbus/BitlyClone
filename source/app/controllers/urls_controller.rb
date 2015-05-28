class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def create
    Url.create(original_url: params[:original_url])
    render nothing: true
  end

  def show
    @url = Url.find_by(short_path: params[:id])
    @url.update(click_count: @url.click_count + 1)
    redirect_to @url.original_url
  end
end
