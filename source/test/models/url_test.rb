require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  def setup
    @url = Url.new(link: "www.google.com")
  end

  test "Url has a link" do
    assert_equal @url.link, "www.google.com"
  end

  test "Url has a shortened link after saving" do
    @url.save!
    assert_not_nil @url.short_link, "test123"
  end
end
