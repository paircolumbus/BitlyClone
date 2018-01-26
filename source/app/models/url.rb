require 'uri'
require 'net/http'

class Url < ActiveRecord::Base
  before_save :shorten_url
  validates :long_url, presence: true
  validate :long_url_proper_format, :long_url_responds

  private

  def shorten_url
    if short_url.nil?
      self.short_url = (0...7).map { [*'0'..'9', *'A'..'Z', *'a'..'z'].sample }.join
    end
  end

  def long_url_proper_format
    unless long_url.start_with? 'http://', 'https://'
      errors.add(:long_url, 'not in a valid format. (must start with http:// or https://)')
    end
  end

  def long_url_responds
    link = URI.parse(long_url)
    if link.is_a?(URI::HTTP) || link.is_a?(URI::HTTPS)
      Net::HTTP.get_response(link)
    else
      errors.add(:long_url, 'must be reachable.')
    end
  rescue
    errors.add(:long_url, 'must be reachable.')
  end

end
