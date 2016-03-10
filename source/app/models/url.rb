class Url < ActiveRecord::Base

  def new(params)
    url = Url.new(params)
    
  end

  def full_shortened
    "chomp.it\/#{shortened}"
  end

  def shorten
    parsed = /https?:\/\/(w+\.)?(?<site>\w*)(?<extra>.*)/.match(self.unshortened)
    if parsed[:site]
      memed = parsed[:site].gsub(/[aeiou]/,'')
      garble = junk
      self.shortened = memed + garble
    else
      nil
    end
  end

  private

  PERMISSABLE = [*'a'..'z',*'A'..'Z',*'0'..'9'].to_a

  def junk
    PERMISSABLE.shuffle[0,24].join
  end

end
