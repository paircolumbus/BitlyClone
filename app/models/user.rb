class User < ActiveRecord::Base


  before_save { self.email = email.downcase }
  validates :first_name,        presence: true,
                                length: {maximum: 50}

  validates :last_name,         presence: true,
                                length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,             presence: true,
                                length: {maximum: 255},
                                format: {with: VALID_EMAIL_REGEX},
                                uniqueness: {case_sensitive: false}

  validates :password,          presence: true,
                                length: {minimum: 8},
                                allow_nil: true

  has_secure_password

  has_many :urls

    # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


end
