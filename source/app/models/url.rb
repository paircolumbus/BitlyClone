class Url < ActiveRecord::Base
  validates :destination, url: true
end
