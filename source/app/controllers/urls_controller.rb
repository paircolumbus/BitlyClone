class UrlsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @url = Url.new(url_params)
    if @url.save
    	#flash[:redirect] = "Shortened URL created successfully!"
    	redirect_to action: 'index'
    	flash[:redirect] = "Shortened URL created successfully!"
    else
    	render 'new'
    end
  end

	def list
		@urls = Url.all
	end

	def index
		@urls = Url.all
	end

	def redirect
		@shortened_url = params['url']
		redirect_to Url.find_by(shortened_url: @shortened_url).url
		@url = Url.find_by(shortened_url: @shortened_url)
		@url.increment_count
	end

	def new
		@url = Url.new
	end

	private

		def url_params
			#require 'pry'; binding.pry
			#params
			params.require(:url).permit(:url, :user, :count)
		end
end