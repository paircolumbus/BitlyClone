class UrlsController < ApplicationController
  include UrlsHelper

  def index
  	@urls = Url.all
  	@url = Url.new(address: "https://")
  end

  def create
  	@url = Url.new(url_params)
  	if @url.save
  	  redirect_to root_path
  	else
  	  @urls = Url.all
  	  render 'index'
  	end
  end

  def show
  	@url = Url.find_by(slug: params[:slug])
    if @url
    	Url.increment_counter(:click_count, @url.id)
    	redirect_to @url.address
    else
      redirect_to root_path
    end
  end
end
