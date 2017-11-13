require 'test_helper'

class RssUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rss_url = rss_urls(:one)
  end

  test "should get index" do
    get rss_urls_url
    assert_response :success
  end

  test "should get new" do
    get new_rss_url_url
    assert_response :success
  end

  test "should create rss_url" do
    assert_difference('RssUrl.count') do
      post rss_urls_url, params: { rss_url: { category_group_id: @rss_url.category_group_id, news_site_id: @rss_url.news_site_id, url: @rss_url.url } }
    end

    assert_redirected_to rss_url_url(RssUrl.last)
  end

  test "should show rss_url" do
    get rss_url_url(@rss_url)
    assert_response :success
  end

  test "should get edit" do
    get edit_rss_url_url(@rss_url)
    assert_response :success
  end

  test "should update rss_url" do
    patch rss_url_url(@rss_url), params: { rss_url: { category_group_id: @rss_url.category_group_id, news_site_id: @rss_url.news_site_id, url: @rss_url.url } }
    assert_redirected_to rss_url_url(@rss_url)
  end

  test "should destroy rss_url" do
    assert_difference('RssUrl.count', -1) do
      delete rss_url_url(@rss_url)
    end

    assert_redirected_to rss_urls_url
  end
end
