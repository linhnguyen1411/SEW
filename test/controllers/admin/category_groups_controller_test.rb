require 'test_helper'

class Admin::CategoryGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_category_group = admin_category_groups(:one)
  end

  test "should get index" do
    get admin_category_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_category_group_url
    assert_response :success
  end

  test "should create admin_category_group" do
    assert_difference('Admin::CategoryGroup.count') do
      post admin_category_groups_url, params: { admin_category_group: {  } }
    end

    assert_redirected_to admin_category_group_url(Admin::CategoryGroup.last)
  end

  test "should show admin_category_group" do
    get admin_category_group_url(@admin_category_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_category_group_url(@admin_category_group)
    assert_response :success
  end

  test "should update admin_category_group" do
    patch admin_category_group_url(@admin_category_group), params: { admin_category_group: {  } }
    assert_redirected_to admin_category_group_url(@admin_category_group)
  end

  test "should destroy admin_category_group" do
    assert_difference('Admin::CategoryGroup.count', -1) do
      delete admin_category_group_url(@admin_category_group)
    end

    assert_redirected_to admin_category_groups_url
  end
end
