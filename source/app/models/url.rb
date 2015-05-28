class Url < ActiveRecord::Base
  before_save :create_short

  private

  def create_short
    self.short_path = SecureRandom.hex(3)
  end
end
