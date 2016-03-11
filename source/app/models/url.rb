class Url < ActiveRecord::Base

  def new(params)
    url = Url.new(params)

  end

  def full_shortened
    "chomp.it\/u\/#{shortened}"
  end

  def brief_unshortened
    first_bit = /\/\/(w{3}\.)?(?<site>.*)/.match(unshortened)
    "#{first_bit[:site].first(25)}...#{unshortened.last(10)}"
  end

  def shorten
    parsed = /https?:\/\/(w+\.)?(?<site>\w*)(?<extra>.*)/.match(self.unshortened)
    if parsed[:site]
      memed = parsed[:site].gsub(/[aeiou]/,'')
      garble = junk while Url.exists?(shortened: garble)
      self.shortened =  memed + garble
    else
      nil
    end
  end

  private

  PERMISSABLE = [*'a'..'z',*'A'..'Z',*'0'..'9'].to_a

  def junk
    PERMISSABLE.shuffle[0,12].join
  end

end
