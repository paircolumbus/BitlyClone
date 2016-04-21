class Url < ActiveRecord::Base
  
  validates :original_url, :format => URI::regexp(%w(http https))

  before_save do
    # following condition is required
    # otherwise the URL will change every time
    # the record gets updated
    if new_record?
      self.shortened_url = generate_random_url
    end
  end

  
  # there is more than one way to skin the cat
  # i am gonna use this method

  validate do |url|
    url.errors[:url] << "URL cannot be blank" if url.original_url.blank?
  end

  def generate_random_url
    
    alphabet = ('a'..'z').to_a
    url = ''

    6.times do
      char = alphabet[rand(26)]
      url += char
    end

    url

  end

end
