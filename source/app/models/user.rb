
class User < ActiveRecord::Base

  validates :username, uniqueness: true, presence: true, length: { maximum: 80 }
  validates :password, presence: true, length: { minimum: 9 }

  has_secure_password
end