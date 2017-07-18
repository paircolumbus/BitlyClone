class Link < ActiveRecord::Base
  before_save :assign

  def random_end(length=5)
    chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    text = ''
    length.times { text << chars[rand(chars.size)] }
    text
  end

  def assign
    self.new_url = random_end
  end

  #  function removeEnd() {
  #    var fullLink = document.getElementById('link_old').value;
  #    var withOutEnd = fullLink.split('.com/').pop();
  #    alert(fullLink.pop(withOutEnd));
  #    return fullLink - withOutEnd;
  #  }
end
