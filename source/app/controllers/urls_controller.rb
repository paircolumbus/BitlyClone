class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    # @url = Url.find_by short_link: params[:id]
    # redirect_to @url.link
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      flash[:success] = "We created a shorter link! :)"
      redirect_to @url
    else
      flash[:error] = "We could not create your link :("
      render :edit
    end
  end

  def edit
  end

  def new
    @url = Url.new
  end

  private
    
    def url_params
      params.require(:url).permit(:link)
    end
end
