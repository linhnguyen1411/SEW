require 'test_helper'

class Admin::NewsSitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_news_sites_index_url
    assert_response :success
  end

end
