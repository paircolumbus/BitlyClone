require 'net/http'

class Url < ActiveRecord::Base
  before_save :shorten_url
  validates :long_url, presence: true, allow_blank: false
  validate :validate_url

  def validate_url
    uri = URI("#{self.long_url}")
    res = Net::HTTP.get_response(uri).code 
    self.errors.add(:base, "This URL is invalid") if res != "200"
  end

  def shorten_url
    self.short_url = "http://localhost:3000/urls/!#{(0..3).map{ rand(36).to_s(36) }.join}"
  end
end