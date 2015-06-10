class Url < ActiveRecord::Base
  before_save :shorten_address
  validates_uniqueness_of :unique_key

  def shorten_address
    self.unique_key = 8.times.map { [*'0'..'9', *'a'..'z'].sample }.join
  end

end
