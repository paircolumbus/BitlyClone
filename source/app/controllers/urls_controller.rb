class UrlsController < ApplicationController
  require 'uri'
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
  	  render 'index'
  	end
  end

  def show
  	@url = Url.find(params[:id])
  	redirect_to @url.address
  end
end
