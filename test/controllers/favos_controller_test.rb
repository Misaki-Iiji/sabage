require 'test_helper'

class FavosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get favos_show_url
    assert_response :success
  end

  test "should get create" do
    get favos_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favos_destroy_url
    assert_response :success
  end

end
