class Link < ActiveRecord::Base
  require 'SecureRandom'
  before_save :shorten

  def shorten
    self.short = SecureRandom.urlsafe_base64(6)
  end

end