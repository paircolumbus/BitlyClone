class UrlsController < ApplicationController
  require 'socket'
  skip_before_action :verify_authenticity_token

  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)
    flash[:notice] = "Your URL: http://#{request.host_with_port}/#{@url.shortcode}"
    redirect_to new_url_path
  end

  def get
    @url = Url.find_by(:shortcode => params[:id])
    redirect_to @url.address
  end

  private
  def url_params
    params.require(:url).permit(:address)
  end
end
