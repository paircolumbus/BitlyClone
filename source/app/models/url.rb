class Url < ActiveRecord::Base
  before_save :default_values


  private

  def generate_shortened_url(length=6)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...length).map{ charset.to_a[rand(charset.size)] }.join
  end

  def default_values
    self.shortened_url = generate_shortened_url
    self.user ||= 'general'
    self.count = 0
  end
end
