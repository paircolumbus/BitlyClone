class Link < ActiveRecord::Base
  before_save :assign

  # validates :old_url, presence: true, format: { with: /.com|.org|.edu|.net|.uk/,
  #   message: "The filed must filled with a URL using .com, .net, .edu, .org, etc." }

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
