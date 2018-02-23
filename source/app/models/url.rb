require 'uri'
class Url < ActiveRecord:: Base

  CHARSET = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a)
  validates :original_url, presence: true
  validate :url_valid?
  #before_save :shorten_url, :on => :create
  before_create :shorten_url

  private def url_valid?
    begin
      error.add(:original_url, " is invalid!") unless
      URI.parse(original_url).kind_of?(URI::HTTP) || URI.parse(original_url).kind_of?(URI::HTTPS)
    rescue
      errors.add(:original_url, " is invalid! (must start with 'http' or 'https')")
    end
end

  private def shorten_url
    puts "inside shotern method"
    self.short_url = create_short_url
  end

  private def create_short_url
    tiny_url =""
    6.times do
      tiny_url << CHARSET.sample
    end
    tiny_url
  end
end
