class Url < ActiveRecord::Base
  validates :short_url, uniqueness: true
  before_create :create_short_url

  def create_short_url
    begin
     short_url = SecureRandom.hex(4)
    end while Url.where(short_url: short_url).exists?

    self.short_url = short_url
  end
end
