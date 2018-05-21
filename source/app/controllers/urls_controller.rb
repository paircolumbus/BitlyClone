class UrlsController < ApplicationController


  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      flash[:notice] = "Success!"
      redirect_to @url
    else
      flash[:error] = "Please make sure your URL is valid. #{@url.errors[:long_url]}."
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def transfer
    @url = Url.find_by(short_url: params[:short_url])
    redirect_to @url.long_url
    #@url.click_count += 1
  end

  private
    def url_params
      params.require(:url).permit(:long_url, :short_url, :click_count)
    end

end
