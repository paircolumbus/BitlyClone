#require 'pry'

class UrlsController < ApplicationController

	def show
		@url = Url.new
	end

	def create
		@url = Url.new
		@url.long_name = params[:url][:long_name]
		@url.short_name = @url.make_short_name
		@url.hit_count = 0
		@url.save
		flash[:success] = "http://0.0.0.0:3000/" + @url.short_name
		redirect_to :action => :show
	end

end
