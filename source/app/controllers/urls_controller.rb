class UrlsController < ApplicationController
  #require 'socket'
  skip_before_action :verify_authenticity_token

  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)
    if @url.errors.any?
      @url.address = ""
      errors = ""
      @url.errors.full_messages.each { |msg| errors += msg + " " }
      p errors
      redirect_to root_path, alert: errors
    else
      redirect_to root_path, notice: "Your URL: http://#{request.host_with_port}/#{@url.shortcode}"
    end
  end

  def get
    @url = Url.find_by(:shortcode => params[:id])
    @url.click_count += 1
    @url.save
    redirect_to @url.address
  end

  private
  def url_params
    params.require(:url).permit(:address)
  end
end
