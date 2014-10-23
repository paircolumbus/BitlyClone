class RerouteController < ApplicationController

	def show
		url = Url.find_by short_name: params[:id]
		if url
			increment_url_count(url)
			if  url_prefixes?(url) 
				redirect_to url.long_name
			else
				redirect_to "http://www."+ url.long_name
			end
		else
			render "static_pages/error"
		end
	end

	def url_prefixes? (url)
		return true if url.long_name.include? 'http'
		return true if url.long_name.include? 'www'
		false
	end

	def increment_url_count(url)
		url.hit_count += 1
		url.save
	end
end