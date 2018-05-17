require 'uri'
require "net/http"

class Url < ActiveRecord::Base
	before_save :create_source_string
	validates :destination, presence: true
	validates_format_of :destination, :with => /\A(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/
	validate :check_for_valid_destination
	def create_source_string
		self.source ||= SecureRandom.urlsafe_base64(5)
	end


	def check_for_valid_destination
		begin
			uri = URI.parse(self.destination)
			res = Net::HTTP.get_response(uri)
			res.code.to_i == 200
		rescue
			false
		end
	end
end


