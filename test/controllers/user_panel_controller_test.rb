require 'test_helper'

class UserPanelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_panel_index_url
    assert_response :success
  end

  test "should get edit" do
    get user_panel_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_panel_update_url
    assert_response :success
  end

end
