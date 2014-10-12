class UrlsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @url = Url.new(url: params['url'])
    @url.save
  end

	def list
		@urls = Url.all
	end

	def redirect
		@shortened_url = params['url']
		redirect_to Url.find_by(shortened_url: @shortened_url).url
	end
end