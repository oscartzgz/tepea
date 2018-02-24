require 'test_helper'

class ExpressionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expressions_index_url
    assert_response :success
  end

end
