require 'digest/sha1'
require 'uri'

class Url < ActiveRecord::Base
  before_validation :smart_url_protocol
  before_create :set_shortcode
  validate :is_url, on: :create

  protected

    def set_shortcode
      full = Digest::SHA1.hexdigest(self.address)
      start = 0
      code = full[start..(start+5)]
      loop do
        break if !Url.find_by(:shortcode => code) || (start + 5 >= full.length)
        start += 1
        code = full[start..(start+5)]
      end
      self.shortcode = code
    end

    def is_url
      errors.add(:address, "is not a valid URL") unless !!URI.parse(address)
    rescue URI::InvalidURIError
      errors.add(:address, "is not a valid URL")
    end

    def smart_url_protocol
      unless self.address[/\Ahttp:\/\//] || self.address[/\Ahttps:\/\//]
        self.address = "http://#{self.address}"
      end
    end



end
