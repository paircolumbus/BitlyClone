require 'uri'
require 'open-uri'

class Url < ActiveRecord::Base
  before_save :make_short_url
  validates :real_url, presence: true
  validate :test_url

  private
    def make_short_url
      self.short_url = SecureRandom.hex(4) if self.short_url.blank?
    end

    def test_url
      # validate url is http or https
      uri = URI(self.real_url)
      errors.add(:real_url, 'is not http or https') unless uri.scheme == 'http' || uri.scheme == 'https'

      # validate url is accessible
      begin
        result = open(uri.to_s)
      rescue
        errors.add(:real_url, 'is not accessible')
      end
    end
end
