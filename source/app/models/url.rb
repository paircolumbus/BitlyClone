class Url < ActiveRecord::Base
  require 'net/http'
  require 'securerandom'
  
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
    #This ensures that if a slug exists then a new one is not created
    temp_slug = self.slug || SecureRandom.base64(4)
    #Creates a slug if one doesn't exist
    while !self.slug && Url.find_by(slug: temp_slug)
      temp_slug = SecureRandom.base64(4)
    end
    self.slug = temp_slug
  end
end
