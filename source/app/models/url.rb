require 'digest/sha1'

class Url < ActiveRecord::Base
  before_save :set_shortcode

  protected

    def set_shortcode
      full = Digest::SHA1.hexdigest(self.address)
      start = 0
      code = full[start..(start+5)]
      loop do
        break if Url.find_by(:shortcode => code) || (start + 5 >= full.length)
        start += 1
        code = full[start..(start+5)]
      end
      self.shortcode = code
    end
end
