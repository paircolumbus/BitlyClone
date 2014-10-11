class UrlsController < ApplicationController

  def create
    @url = Url.new(params[:url])
    @url.save
  end
end
