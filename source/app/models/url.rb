class Url < ActiveRecord::Base
  validates :long_url, presence: true, format: { with: /http(|s):\/\/.+/ }
end
