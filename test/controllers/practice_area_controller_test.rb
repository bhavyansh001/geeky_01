require "test_helper"

class PracticeAreaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get practice_area_index_url
    assert_response :success
  end
end
