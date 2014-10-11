require 'pry'

class UrlsController < ApplicationController

	def show
		@url = Url.new
	end

	def create
		@url = Url.new
		@url.long_name = params[:url][:long_name]
		@url.short_name = @url.make_short_name
		@url.save
		redirect_to :action => :show
	end

end
