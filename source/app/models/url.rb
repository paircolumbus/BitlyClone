class Url < ActiveRecord::Base
  before_create :trim_url

  private
    def trim_url
      self.short_url = SecureRandom.hex(3)
    end

end
