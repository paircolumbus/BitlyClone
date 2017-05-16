class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  #show

  def new
    @url = Url.new
  end

  def edit
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(params.require(:url).permit(:full))

    if @url.save
      redirect_to urls_path
    else
      render 'edit'
    end
  end

  def update
    @url = Url.new(params.require(:url).permit(:full))

    if @url.save
      redirect_to urls_path
    else
      render 'edit'
    end
  end

  #destroy

  def short
    url = Url.find_by_short(params[:short])
    redirect_to url ? url.full : urls_path
  end
end
