require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get posts_show_url
    assert_response :success
  end

  test 'should get new' do
    get posts_new_url
    assert_response :success
  end
end
