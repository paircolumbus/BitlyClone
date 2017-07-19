class Link < ActiveRecord::Base
  before_save :assign#, :count_clicks

  def create_counter(new_url)
    self.counter( { :new_url => new_url } )
  end
  
  # def init_count
  #   count = 0
  # end
  #
  # def set_counter
  #   self.counter = init_count
  # end

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
