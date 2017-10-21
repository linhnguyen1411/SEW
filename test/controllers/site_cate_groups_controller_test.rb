require 'test_helper'

class SiteCateGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_cate_group = site_cate_groups(:one)
  end

  test "should get index" do
    get site_cate_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_site_cate_group_url
    assert_response :success
  end

  test "should create site_cate_group" do
    assert_difference('SiteCateGroup.count') do
      post site_cate_groups_url, params: { site_cate_group: { cate_groups_id: @site_cate_group.cate_groups_id, news_sites_id: @site_cate_group.news_sites_id } }
    end

    assert_redirected_to site_cate_group_url(SiteCateGroup.last)
  end

  test "should show site_cate_group" do
    get site_cate_group_url(@site_cate_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_cate_group_url(@site_cate_group)
    assert_response :success
  end

  test "should update site_cate_group" do
    patch site_cate_group_url(@site_cate_group), params: { site_cate_group: { cate_groups_id: @site_cate_group.cate_groups_id, news_sites_id: @site_cate_group.news_sites_id } }
    assert_redirected_to site_cate_group_url(@site_cate_group)
  end

  test "should destroy site_cate_group" do
    assert_difference('SiteCateGroup.count', -1) do
      delete site_cate_group_url(@site_cate_group)
    end

    assert_redirected_to site_cate_groups_url
  end
end
