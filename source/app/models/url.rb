class Url < ActiveRecord::Base
  
  before_save :shorten_url
  validates_uniqueness_of :unique_key 

  private
    #generate 6 digit unique identifier
    def shorten_url(record)
      if self.unique_key.nil?
        self.unique_key = 6.times.map { [*'0'..'9', *'A'..'Z'].sample }.join
      end
    end

end
