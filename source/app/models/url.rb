require 'uri'
require "net/http"
require 'faraday'

class Url < ActiveRecord::Base
  before_save :shorten_address
  validate :validate_url
  # validates :address, :format => URI::regexp(%w(http https))
  validates_uniqueness_of :unique_key

  # IN PROGRESS
  def validate_url
    if self.address.match(/^https?:\/\//).nil?
      errors.add(:address, "needs to be a valid url")
    else
      if self.address.match(URI::regexp(%w(http https))).nil?
        errors.add(:address, "needs to be a valid url")
      end

      begin
        response = send_http_request(self.address)
        if response.status.to_i >= 400
          errors.add(:address, "needs to be a valid url")
        end
      rescue Faraday::ConnectionFailed
        errors.add(:address, "needs to be a valid url")
      end
    end
  end

  def shorten_address
    if self.unique_key.nil?
      self.unique_key = 8.times.map { [*'0'..'9', *'a'..'z'].sample }.join
    end
  end

  private
  def send_http_request url
    Faraday.head url
  end

end
