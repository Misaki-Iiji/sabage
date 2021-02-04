require 'test_helper'

class InfomationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infomations_index_url
    assert_response :success
  end

  test "should get show" do
    get infomations_show_url
    assert_response :success
  end

  test "should get edit" do
    get infomations_edit_url
    assert_response :success
  end

end
