class Url < ActiveRecord::Base
  validates :original, presence: true,
                    length: { minimum: 1 },
                    format: {with: /\A((http|https):\/\/).*\Z/}


  before_save :shortify

  private
  def shortify
    if self.shortened == nil
      self.click_count = 0
      begin
        self.shortened = "https://bit.ly/" + SecureRandom.hex(4)
      end while Url.where(shortened: self.shortened).exists?
    end
  end
end
