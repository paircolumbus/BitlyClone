class Url < ActiveRecord::Base
  before_save :default_values


  private

  def generate_shortened_url(length=6)
  	charset = [*('a'..'z'),*('A'..'Z'),*('0'..'9')]
    (0...length).map{ charset.to_a[rand(charset.size)] }.join
  end

  def default_values
    self.shortened_url = generate_shortened_url
    self.user ||= 'general'
    self.count = 0
  end
end
