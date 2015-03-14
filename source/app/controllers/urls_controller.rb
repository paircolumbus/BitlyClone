class UrlsController < ApplicationController
  def index
    @urls = Url.all
    @url = Url.new
  end

  def shortener
    #this action makes short URLs!
  end
end
