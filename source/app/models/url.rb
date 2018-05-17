require 'net/http'

class Url < ActiveRecord::Base
  before_create :shorten_url
  validates :long_url, presence: true, allow_blank: false
  validate :validate_url

  def validate_url
    uri = URI("#{self.long_url}")
    # this doesn't work if the input isn't a url, i.e., it only works if an error code is returned
    if res = Net::HTTP.get_response(uri)
    else res.code = "x"
    end
    self.errors.add(:base, "This URL is invalid, #{res.message}") if res.code != "200"
  end

  def shorten_url
    self.short_url = "!#{(0..3).map{ rand(36).to_s(36) }.join}"
  end
end