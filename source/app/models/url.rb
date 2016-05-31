require 'digest/sha1'

class Url < ActiveRecord::Base
  def self.build_for_url(url)
    @url = new(:address => url)
    @url.shortcode = self.get_code(url)
    @url.save
    @url
  end

  protected

    def self.get_code(str)
      full = Digest::SHA1.hexdigest(str)
      start = 0
      code = full[start..(start+5)]
      loop do
        break if !self.find_by(:shortcode => code) || (start + 5 >= full.length)
        start += 1
        code = full[start..(start+5)]
      end
      code
    end
end
