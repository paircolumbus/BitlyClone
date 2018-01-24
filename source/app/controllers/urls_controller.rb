class UrlsController < ApplicationController
  include UrlsHelper

  def index
  	@urls = Url.all
  	@url = Url.new(address: "https://")
  end

  def create
  	@url = Url.new(url_params)
  	@url.click_count = 0
  	if @url.save
  	  redirect_to root_path
  	else
  	  @urls = Url.all
  	  render 'index'
  	end
  end

  def show
  	@url = Url.find_by(slug: params[:slug])
  	@url.click_count += 1
  	@url.save
  	redirect_to @url.address
  end
end
