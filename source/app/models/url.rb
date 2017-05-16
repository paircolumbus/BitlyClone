require 'uri'
class Url < ActiveRecord::Base
  before_save :bitly_generate, :unless => :bitly_clone
  validates :address, :if => :validate_url, presence: true, uniqueness: true, length: {minimum: 1}, :format => /\Ahttp[s]?:\/\/\S+/
  validates :bitly_clone, uniqueness: true

  private
  def bitly_generate
    rando_arr = ('a'..'z').to_a + ('A'..'Z').to_a
    #bitly_link = "https://cmm.ly/"+rando_arr.sample(6).join
    bitly_link = rando_arr.sample(8).join
    self.bitly_clone = bitly_link
  end

  def validate_url
    !!URI.regexp(['http','https'])
  end

end
