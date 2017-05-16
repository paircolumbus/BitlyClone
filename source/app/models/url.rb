require 'uri'

class Url < ActiveRecord::Base
  before_save :create_short
  validates :original_url, presence: true
  validate :check_protocol, :uri_check, :can_be_reached

  private

  def check_protocol
    errors.add(:base, "URL must begin with http:// or https://") unless self.original_url =~ /^https?:\/\//
  end

  def uri_check
    errors.add(:base, "Not a valid URL!") unless self.original_url =~ URI.regexp(['http', 'https'])
  end

  def can_be_reached
    begin
      HTTParty.get(self.original_url).code == 200
    rescue
      errors.add(:base, "Not reachable")
    end
  end

  def create_short
    self.short_path ||= SecureRandom.hex(3)
  end
end
