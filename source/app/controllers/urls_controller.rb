class UrlsController < ApplicationController
  require 'uri'
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
  	  render 'index'
  	end
  end

  def show
  	@url = Url.find(params[:id])
  	@url.click_count += 1
  	@url.save
  	redirect_to @url.address
  end
end
