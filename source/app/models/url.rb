require 'uri'
require 'net/http'

class Url < ActiveRecord::Base
  ALPHANUMERIC_CHARACTERS = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a)

  validates_presence_of :original_url
  validates_format_of :original_url, :with => URI::regexp, :message => "must be a valid Ruby URI"
  validate :original_url_starts_with_http_or_https
  validate :original_url_must_return_a_response

  before_save :shorten_url

  def original_url_starts_with_http_or_https
    if not original_url =~ /^https?:\/\//
      errors.add(:original_url, "must start with http:// or https://")
    end
  end

  def original_url_must_return_a_response
    return unless original_url.present? && original_url =~ URI::regexp(['http', 'https'])
    uri = URI.parse(original_url)
    response = Net::HTTP.get_response(uri)
  rescue URI::InvalidURIError
    errors.add(:original_url, "must respond to a HTTP request")
  rescue Errno::ECONNREFUSED
    errors.add(:original_url, "must respond to a HTTP request")
  rescue SocketError
    errors.add(:original_url, "must respond to a HTTP request")
  end

  def shorten_url
    self.shortened_url = generate_key unless self.shortened_url
  end

  def generate_key
    key = ""
    7.times { key << ALPHANUMERIC_CHARACTERS.sample }
    key
  end
end
