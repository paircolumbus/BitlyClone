require 'SecureRandom'
require 'net/http'

class Link < ActiveRecord::Base

  belongs_to :user
  validate :valid_uri, on: :create
  before_save :shorten


  def valid_uri
    regex_check = /\A#{URI::regexp(["http", "https"])}\z/
    if regex_check =~ long_url
      check_http
    else
      self.errors.add(:url, "invalid")
    end
  end

  def check_http
    uri = URI(long_url)
    res = Net::HTTP.get_response(uri)
    self.errors.add(:url_response_code, "invalid") if res.code.to_i >= 400
  end

  def add_click_count
    self.click_count += 1
  end

  private
  def shorten
    self.short_url ||= SecureRandom.urlsafe_base64(6)
  end

end