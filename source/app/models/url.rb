class Url < ActiveRecord::Base
  validates :destination, url: true

  before_validation do
    self.destination = "http://#{self.destination}" unless /^[a-z]+:/ =~ self.destination
  end
  
  def shortcode
    id.to_s(36)
  end
  
  def self.decode_shortcode shortcode
    shortcode.to_i(36)
  end
end
