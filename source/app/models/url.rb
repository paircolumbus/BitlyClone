require 'uri'

class Url < ActiveRecord::Base

validates :long_url, presence: true
validates :short_url, uniqueness: true
validate :compliance_check

before_create :generate_url


def valid_url?
  uri = URI.parse(self.long_url)
  uri.is_a?(URI::HTTP) && !uri.host.nil?
rescue URI::InvalidURIError
  false
end

def compliance_check
  unless self.valid_url?
    errors.add(:long_url, "Your URL should include 'http://' or 'https://'")
  end
end


private
  def generate_url
    self.short_url = "#{SecureRandom.hex(4)}"
    generate_url if Url.exists?(short_url: self.short_url)
  end

end
