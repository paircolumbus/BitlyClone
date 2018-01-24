class Url < ActiveRecord::Base
  require 'net/http'
  
  before_save :generate_shortened_url

  validates :address, presence: true, format: { with: /\Ahttps?:\/\/.*/, message: "must begin with 'http://' or 'https://'" }
  validate :url_is_correct_format, :url_responds_to_http_request

  def url_is_correct_format
  	unless address =~ /\A#{URI.regexp}\z/
  	  errors.add(:address, "is not a valid url format")
  	end
  end

  def url_responds_to_http_request
  	url = URI.parse(address)
  	begin
  	  response = Net::HTTP.get_response(url)

  	  if response.code == "404"
  	    errors.add(:address, "is not accessible via HTTP(S)")
  	  end
  	rescue
  	  errors.add(:address, "is not accessible via HTTP(S)")
  	end
  end

  def generate_shortened_url
  end
end
