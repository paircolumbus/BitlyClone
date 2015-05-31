class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def create

    begin  
      response = Net::HTTP.get_response(uri)
    rescue  
      flash[:error] = "not a valid url"
    end  
  
    @url = Url.new(url_params)
    @url.shorten_url
    @url.counter = 0
    if @url.save
      redirect_to url_path(@url)
    else
      render 'new'
    end
  end

  def link
    @url = Url.where(short: params[:short])
    @url[0].counter +=1
    @url[0].save
    redirect_to 'http://' + @url[0].orig
  end

  private
  def url_params
    params.require(:url).permit(:orig)
  end
end
