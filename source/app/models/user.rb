require 'bcrypt'

class User < ActiveRecord::Base
  has_many :urls

  attr_accessor :plain_password
  attr_accessor :new_password

  before_save :hash_password, :if=>:password_changed?
  before_create :hash_password

  def password_changed?
    if self.new_password
      return true
    else
      return false
    end
  end

  def changePassword(new_password)
    self.plain_password = new_password
    self.new_password = true
    self.save!
  end

  def self.authenticate(email, password)
    # Because we use bcrypt we can't do this query in one part, first
    # we need to fetch the potential user
    if user = find_by_email(email)
      # Then compare the provided password against the hashed one in the db.
      if BCrypt::Password.new(user.hashed_password).is_password? password
        # If they match we return the user
        return user
      end
    end
    # If we get here it means either there's no user with that email, or the wrong
    # password was provided.  But we don't want to let an attacker know which.
    return nil
  end

  private

  def hash_password
    self.hashed_password = BCrypt::Password.create(self.plain_password)
  end
end
