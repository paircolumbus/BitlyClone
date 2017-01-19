class UrlsController < ApplicationController
  #GET urls
  def index
    @urls = Url.all #rake db:reset db:migrate
  end

  #GET url
  def new
    @url = Url.new
  end

  #POST urls
  def create
    check = Url.find_by(:address => params[:url][:address])
    if !check
      @url = Url.create(:address => params[:url][:address])
    end
    redirect_to urls_path
  end

  def show
    @url = Url.where :bitly_clone => params[:short]
    if @url[0]
      redirect_to @url[0].address
    else
      render plain: @url[0].bitly_clone.inspect
    end
  end
end
