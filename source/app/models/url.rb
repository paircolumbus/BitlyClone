class Url < ActiveRecord::Base
  before_save :bitly_generate
  validates :address, presence: true, uniqueness: true
  validates :bitly_clone, uniqueness: true

  def bitly_generate
    rando_arr = ('a'..'z').to_a + ('A'..'Z').to_a
    #bitly_link = "https://cmm.ly/"+rando_arr.sample(6).join
    bitly_link = rando_arr.sample(8).join
    self.bitly_clone = bitly_link
  end
  
end
