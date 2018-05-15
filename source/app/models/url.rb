class Url < ActiveRecord::Base
  before_save :shorten_url

  def shorten_url
    self.short_url = "http://localhost:3000/urls/!#{(0..3).map{ rand(36).to_s(36) }.join}"
  end
end