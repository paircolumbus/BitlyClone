class Url < ActiveRecord::Base
  before_save :make_short_url

  private
    def make_short_url
      self.short_url = SecureRandom.hex(4) if self.short_url.empty?
    end
end
