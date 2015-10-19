#
class Session < ActiveRecord::Base
  attr_accessor :transient_login, :transient_password
end
