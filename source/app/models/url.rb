class Url < ActiveRecord::Base
  before_save :generate_shortened_url

  def generate_shortened_url

  end
end
