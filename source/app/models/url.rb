class Url < ActiveRecord::Base
  before_save :shorten_url
  validates :long_url, presence: true

  private

  def shorten_url
    self.short_url = (0...7).map { [*'0'..'9', *'A'..'Z', *'a'..'z'].sample }.join
  end
end
