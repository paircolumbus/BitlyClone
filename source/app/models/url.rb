class Url < ActiveRecord::Base
  validates :long_url, format: URI::regexp

  before_create :setup

  def setup
    self.click_count = 0
    self.short_url = SecureRandom.urlsafe_base64 4
  end

  def to_param
    short_url
  end
end
