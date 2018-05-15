class Url < ActiveRecord::Base
  validates :long_url, presence: true
  validates :short_url, uniqueness: true

  validate :uri_properly_formatted

  before_create :create_short_url

  def create_short_url
    begin
     short_url = SecureRandom.hex(4)
    end while Url.where(short_url: short_url).exists?

    self.short_url = short_url
  end

  def compliant?
    new_uri = URI.parse(self.long_url)
    new_uri.is_a?(URI::HTTP) && !new_uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def uri_properly_formatted
    unless self.compliant?
      errors.add(:long_url, "url is invalid, must include 'http://' or 'https://'")
    end
  end
end
