class Url < ActiveRecord::Base
  before_save :default_values
  VALID_URL_REGEX = /\A(http|https):\/\//
  validates :url, presence: true, format: { with: VALID_URL_REGEX }

def increment_count
    self.count += 1
    self.save
end

  private

  def generate_shortened_url(length=6)
  	[*('a'..'z'),*('A'..'Z'),*('0'..'9')].sample(6).join
  end

  def default_values
    self.shortened_url ||= generate_shortened_url
    self.user ||= 'general'
    self.count ||= 0
  end
end
