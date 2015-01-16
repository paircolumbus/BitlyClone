class Url < ActiveRecord::Base
  validates :link, presence: true
  before_create :create_short_url
  validate :url_is_valid, on: :create

  private
  def create_short_url
    self.short_link = (SecureRandom.random_number(9999999) + 100000).to_s(36)
  end

  def url_is_valid 
    url = URI.parse(link)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == 'https')
    path = url.path if url.path.present?
    res = req.request_head(path || '/')
    errors.add(:link, 'must return status code < 400') if res.code.to_i >= 400
  rescue URI::Error
    errors.add(:link, 'could not be reached')
  end

end
