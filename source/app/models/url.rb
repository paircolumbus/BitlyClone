class Url < ActiveRecord::Base
  before_save :make_key

  def make_key
    begin
      self.unique_key = SecureRandom.hex(2)
    end while self.class.exists?(:unique_key => unique_key)
  end
end
