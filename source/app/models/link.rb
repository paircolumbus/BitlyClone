class Link < ActiveRecord::Base
  before_save :assign

  def random_end(length=5)
    chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    text = ''
    length.times { text << chars[rand(chars.size)] }
    text
  end

  def assign
    self.new_url = random_end
  end
end
