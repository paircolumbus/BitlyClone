class Url < ActiveRecord::Base
#attr_accessor :long_name, :short_name
	def make_short_name
		new_short_name = ''
		6.times do new_short_name = new_short_name + ('a'..'z').to_a[rand(26)]
		end
		new_short_name
	end
end
