class UrlsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @url = Url.new(url_params)
    if @url.save
    	flash[:success] = "Shortened URL created successfully!"
    	redirect_to action: 'list'
    else
    	render 'new'
    end
  end

	def list
		@urls = Url.all
	end

	def redirect
		@shortened_url = params['url']
		redirect_to Url.find_by(shortened_url: @shortened_url).url
	end

	def new
		@url = Url.new
	end

	private

		def url_params
			params.require(:url).permit(:url, :user, :count)
		end
end