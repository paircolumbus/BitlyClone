require 'test_helper'

class UrlsControllerTest < ActionController::TestCase
  setup do
    @valid_url = urls :valid
    @invalid_url = urls :invalid
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valid url" do
    assert_difference('Url.count') do
      post :create, url: { click_count: @valid_url.click_count, long_url: @valid_url.long_url, short_url: @valid_url.short_url }
    end

    assert_redirected_to urls_url
  end

  test "should not create invalid url" do
    assert_no_difference('Url.count') do
      post :create, url: { click_count: @invalid_url.click_count, long_url: @invalid_url.long_url, short_url: @invalid_url.short_url }
    end
  end

  test "should show valid url" do
    get :show, id: @valid_url
    assert_response :redirect
    assert_redirected_to @valid_url.long_url
  end

  test "should not show nonexistent url" do
    assert_raise ActionController::RoutingError do
      get :show, id: 'nonexistent'
      assert_response :missing
    end
  end

  test "should destroy valid url" do
    assert_difference('Url.count', -1) do
      delete :destroy, id: @valid_url
    end

    assert_redirected_to urls_path
  end
end
