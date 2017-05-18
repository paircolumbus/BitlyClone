class Url < ActiveRecord::Base
  validates :long_url, presence: true
  before_create :generate_short_url

  private

  def generate_short_url
    self.short_url = SecureRandom.hex(3)
  end

end
