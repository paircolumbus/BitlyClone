class Url < ActiveRecord::Base
  validates :long_url, presence: true
  validates :long_url, uniqueness: {scope: :long_url}
  validates :long_url, format: {with: URI.regexp }, if: 'long_url.present?'
  before_create :generate_short_url

  private

  def generate_short_url
    # Create a random 6 hexadecimal digit for unique short urls
    # Bytes needed: 3
    self.short_url = SecureRandom.hex(3)
  end
end
