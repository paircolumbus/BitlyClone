class Url < ActiveRecord::Base
  validates :long_url, presence: true
  validate :long_url_is_uri_valid
  validate :long_url_is_reachable

  private
  def long_url_is_uri_valid
    unless long_url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      errors.add(:long_url, 'must be valid uri')
    end
  end

  def long_url_is_reachable
    begin
      response = HTTParty.get(long_url, timeout: 1)

      if response.code.to_i != 200
        errors.add(:long_url, 'must return a 200 code')
      end
    rescue
      errors.add(:long_url, 'must be accessible')
    end
  end
end
