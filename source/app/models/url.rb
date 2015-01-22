class Url < ActiveRecord::Base
  before_save :set_permalink

  def set_permalink
    self.short_url = SecureRandom.urlsafe_base64 4
  end

  def to_param
    short_url
  end
end
