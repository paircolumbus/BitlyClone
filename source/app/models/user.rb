class User < ActiveRecord::Base
  has_many :links
  validates :name, presence: true
  has_secure_password

end