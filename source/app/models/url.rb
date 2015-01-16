class Url < ActiveRecord::Base
  validates :link, presence: true
  before_create :create_short_url

  private
  def create_short_url
    self.short_link = (SecureRandom.random_number(9999999) + 100000).to_s(36)
  end
end
