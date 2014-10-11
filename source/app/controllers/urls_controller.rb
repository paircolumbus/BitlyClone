class UrlsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @url = Url.new(url: params['url'])
    @url.save
  end
end
