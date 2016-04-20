class UrlsController < ApplicationController

	def index
		@urls = Url.all
	end

	def new

	end

	def generate_random_url
		
		alphabet = ('a'..'z').to_a
		url = ''

		6.times do
			char = alphabet[rand(26)]
			url += char
		end

		"http://bit.ly/#{url}"
	end

	def create

		url = Url.new
		url.original_url = params[:original_url]
		url.shortened_url = generate_random_url
		
		if url.save
			redirect_to action: "index"
		else
			flash.now[:error] = "Could not save the URL"
  			render action: "new"
  		end
	end

	def destroy

		# don't
		# url = Url.find{ |u| u.id == params[:id].to_i }
		
		# do
		url = Url.find(params[:id])
		
		if url.destroy
			redirect_to action: "index"
		else
			# TODO: return 404
			flash.now[:error] = "Could not delete the URL"
  			render action: "index"
  		end
	end

end
