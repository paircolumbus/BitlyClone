class Link < ActiveRecord::Base
  require 'SecureRandom'
  require 'net/http'

  before_save :shorten
  before_save :valid_uri
  before_save :check_http

  validates :long_url, presence: true

  def shorten
    self.short_url = SecureRandom.urlsafe_base64(6)
  end

  def valid_uri
    uri = URI.parse(long_url)
    %w( http https ).include?(uri.scheme)
  end

  def check_http
    uri = URI(long_url)
    res = Net::HTTP.get_response(uri)
    res.code.to_i < 400
  end

end