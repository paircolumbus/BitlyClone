class Url < ActiveRecord::Base
  attr_accessible :url, :click_count, :short_url
end