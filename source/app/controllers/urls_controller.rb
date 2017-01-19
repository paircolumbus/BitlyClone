class UrlsController < ApplicationController
  #GET urls
  #def index
    #@urls = Url.all #rake db:reset db:migrate
  #end

  #GET url
  def new
    @url = Url.new
    @urls = Url.all
  end

  #POST urls
  def create
    check = Url.find_by(:address => params[:url][:address])
    if !check
      @url = Url.create(:address => params[:url][:address])
    end
    flash[:error] = @url.errors.full_messages.to_sentence
    redirect_to root_path
  end

  def move
    @url = Url.where :bitly_clone => params[:short]
    if @url[0]
      @url[0].increment!(:click_count)
      redirect_to @url[0].address, outward: "true"
    else
      redirect_to urls_path
    end

  end
end
