class Url < ActiveRecord::Base
	before_save :create_short

	def create_short(full_url)
		full_url = ""
		
	end
end
