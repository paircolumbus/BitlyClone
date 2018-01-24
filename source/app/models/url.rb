class Url < ActiveRecord::Base
  before_save :shorten_url

  private
  def shorten_url
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    self.short_url = Array.new(6){ range.sample }.join if self.short_url.nil?
  end
end
