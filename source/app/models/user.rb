class User < ActiveRecord::Base
  validates :name, presence: true
  has_secure_password

end