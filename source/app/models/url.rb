class Url < ActiveRecord::Base

  validates :full, presence: true

  before_save :generate_short

  private

    def generate_short
      self.short = SecureRandom.hex(3)
    end

end
