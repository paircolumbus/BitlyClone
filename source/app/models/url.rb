require 'securerandom'

BASE62_DIGITS = ('a'..'z').to_a | ('A'..'Z').to_a | (0..9).to_a

class Url < ActiveRecord::Base
  validates :long_url, presence: true, uniqueness: true
  validates :short_key, presence: true, uniqueness: true, allow_blank: true

  before_save :generate_short_key

  private
  def generate_short_key
    key = (0...7).map { SecureRandom.random_number BASE62_DIGITS.length }.map { |idx| BASE62_DIGITS[idx] }.join
    self.short_key = key
  end
end
