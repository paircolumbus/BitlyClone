require 'test_helper'

class GtControllerTest < ActionController::TestCase
  def setup
    @url = urls(:google)
  end

  test "should redirect to link if given short_link" do
    get :show, id: @url.short_link
    assert_redirected_to @url.link
  end
end
