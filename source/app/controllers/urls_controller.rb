class UrlsController < ApplicationController

  def index
    @urls = Url.all()
  end

  def show
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(params.require(:url).permit(:address))
    @url.save
    redirect_to_index
  end

  def new
    @url = Url.new
  end

  def destroy
    Url.find(params[:id]).destroy
    redirect_to_index
  end

  def redirect_to_index
    redirect_to urls_path
  end
end
