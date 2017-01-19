class UrlsController < ApplicationController
  def index
    @urls = Url.all #rake db:reset db:migrate
  end
  def new
    @url = Url.new
  end
  def create
    check = Url.find_by(:address => params[:url][:address])
    if !check
      @url = Url.create(:address => params[:url][:address])
    end
    redirect_to urls_path
  end
  #def bitly_path
  #  @url.find_by(bitly_clone: params[:bitly_clone])
  #  redirect_to @url.address
  #end
end
