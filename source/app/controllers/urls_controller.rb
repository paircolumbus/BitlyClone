class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end
end
