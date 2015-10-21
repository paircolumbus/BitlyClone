#
class User < ActiveRecord::Base
  validates :name, :login, :password, presence: true
  before_save :hash_password

  private

  def hash_password
    if self.id.nil?
      self.password= BCrypt::Password.create(password)
    end
  end

end
