require 'test_helper'

class ProfilePageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get profile_page_show_url
    assert_response :success
  end

end
