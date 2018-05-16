require 'net/http'

class Url < ActiveRecord::Base
  before_create :reset_click_count

  validates :long_url, presence: true, format: { with: /http(|s):\/\/.+/ }
  validate :long_url_is_uri_valid
  validate :long_url_is_reachable

  private

  def reset_click_count
    self.click_count = 0
  end

  def long_url_is_uri_valid
    unless long_url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      errors.add(:long_url, 'must be valid uri')
    end
  end

  def long_url_is_reachable
    begin
      response = HTTParty.get(long_url, timeout: 2)

      if response.code.to_i != 200
        errors.add(:long_url, 'must return a 200 code')
      end
    rescue
      errors.add(:long_url, 'must be accessible')
    end
  end
end
