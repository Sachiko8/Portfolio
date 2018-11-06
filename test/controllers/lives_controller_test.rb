require 'test_helper'

class LivesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lives_show_url
    assert_response :success
  end

  test "should get new" do
    get lives_new_url
    assert_response :success
  end

  test "should get create" do
    get lives_create_url
    assert_response :success
  end

  test "should get edit" do
    get lives_edit_url
    assert_response :success
  end

  test "should get update" do
    get lives_update_url
    assert_response :success
  end

  test "should get destroy" do
    get lives_destroy_url
    assert_response :success
  end

end
