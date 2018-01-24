class Url < ActiveRecord::Base
  require 'net/http'
  
  before_save :generate_shortened_url

  validates :address, presence: true
  validates :address, format: { with: /\Ahttps?:\/\/.*/, message: "must begin with 'http://' or 'https://'" }
  validates :address, uniqueness: true
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
  	url = URI.parse(address)
  	if url.host.present?
  	  #Remove 'www.' from start of string if present
  	  stripped_host = url.host.gsub(/\Awww\./, "") || url.host
  	  #Remove top level domain from URL
  	  stripped_host = stripped_host.gsub(/\..*/, "") || stripped_host
  	  #Shorten URL either by removing vowels or halving length if no vowels
  	  shortened_host = stripped_host.gsub(/[aeiou]/, "") || stripped_host[0..(stripped_host.length/2)]

  	  count = 0
  	  #This ensures that if a slug exists then a new one is not created
  	  temp_shortened_host = self.slug || shortened_host
  	  #Creates a slug if one doesn't exist
  	  while !self.slug && Url.find_by(slug: temp_shortened_host)
  	  	count += 1
  	  	temp_shortened_host = "#{shortened_host}#{count}"
  	  end
  	  self.slug = temp_shortened_host
  	else
  	  errors.add(:address, "no url host present")
  	end
  end
end
