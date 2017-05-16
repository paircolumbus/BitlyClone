class Url < ActiveRecord::Base
  belongs_to :user

  before_create :add_shortened

  def increment_count
    self.click_count = 0 if self.click_count.nil?
    self.click_count += 1
    self.save!
  end


  private

  def add_shortened
    letters = nil

    until already_created(letters)
      # from http://stackoverflow.com/questions/88311/how-best-to-generate-a-random-string-in-ruby
      letters = (0...5).map { ('a'..'z').to_a[rand(26)] }.join
    end

    self.shortened = letters
  end

  def already_created(short_url)
    puts short_url
    return false if short_url.nil?
    Url.find_by(shortened: short_url).nil?
  end
end
