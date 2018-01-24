require 'uri'
require 'net/http'

class Url < ActiveRecord::Base
  validate :long_url_must_be_valid_uri, :long_url_must_be_reachable
  validates :long_url, presence: true
  before_save :shorten_url

  private
  def shorten_url
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    self.short_url = Array.new(6){ range.sample }.join if self.short_url.nil?
  end

  def long_url_must_be_valid_uri
    return if long_url.empty?

    unless long_url =~ /\A#{URI.regexp(['http', 'https'])}\z/
      errors.add(:long_url, "must be a valid url prefaced with http(s)://")
    end
  end

  def long_url_must_be_reachable
    return if long_url.empty?

    url = URI.parse(long_url)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = 1
    http.start { |http|
      http.get(url)
    }

  rescue
    errors.add(:long_url, "must be a reachable url")
  end
end
