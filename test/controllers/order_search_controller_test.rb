require "test_helper"

class OrderSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_search_index_url
    assert_response :success
  end
end
