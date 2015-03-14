class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def shortener
    #this action makes short URLs!

  end
end
