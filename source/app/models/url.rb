require 'securerandom'
require 'uri'
require 'net/http'

BASE62_DIGITS = ('a'..'z').to_a | ('A'..'Z').to_a | (0..9).to_a

class Url < ActiveRecord::Base
  validates :long_url, presence: true, uniqueness: true
  validates :short_key, presence: true, uniqueness: true, allow_blank: true

  validate :url_must_be_valid

  before_save :generate_short_key

  def click!
    Url.increment_counter :click_count, self.id
  end

  private
  def generate_short_key
    if self.short_key.nil? || self.short_key.empty?
      # I don't particularly like this loop, could probably do it deterministically in some way
      # but it works.
      begin
        self.short_key = make_random_key
      end while Url.exists?(short_key: self.short_key)
    end
  end

  def make_random_key
    (0...7).map { SecureRandom.random_number BASE62_DIGITS.length }.map { |idx| BASE62_DIGITS[idx] }.join
  end

  def url_must_be_valid
    raw_url = self.long_url

    errors.add(:long_url, 'must not be empty.') if raw_url.empty?
    errors.add(:long_url, 'must be http:// or https://') unless raw_url =~ /\Ahttps?:\/\//
    errors.add(:long_url, 'must be a valid URI.') unless raw_url =~ /\A#{URI::regexp}\z/

    if errors.empty?
      begin
        url = URI.parse(raw_url)
        req = Net::HTTP.new(url.host, url.port)
        req.use_ssl = true if raw_url.start_with? 'https://'

        res = req.request_head(url)
        errors.add(:long_url, 'is not reachable via HTTP/HTTPS requests.') if res.code == 404
      rescue
        errors.add(:long_url, 'is not reachable via HTTP/HTTPS requests.')
      end
    end
  end
end
