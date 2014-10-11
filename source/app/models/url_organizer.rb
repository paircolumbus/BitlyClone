class UrlOrganizer < ActiveRecord::Base

	#def initialize 
    # @longName = ''
    # @shortName = ''
	#end

	def make_short_name
		new_short_name = ''
		6.times do new_short_name = new_short_name + ('a'..'z').to_a[rand(26)]
		end
		new_short_name
	end

	def populate longName
	@longName = longName
    @shortName = make_short_name
	end
end
