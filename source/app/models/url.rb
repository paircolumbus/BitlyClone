require 'securerandom'
require "net/http"
require "uri"


class Url < ActiveRecord::Base
  validates :orig, presence: true, format: { with: /.+\.\w+/, message: "Not a valid web address." }
  # before_save do 
  #   self.short = SecureRandom.hex(3)
  # end
  def shorten_url
    self.short = SecureRandom.hex(3)
  end
end
