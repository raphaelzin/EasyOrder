require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get staff" do
    get admins_staff_url
    assert_response :success
  end

  test "should get categories" do
    get admins_categories_url
    assert_response :success
  end

  test "should get manu" do
    get admins_manu_url
    assert_response :success
  end

  test "should get stats" do
    get admins_stats_url
    assert_response :success
  end

  test "should get settings" do
    get admins_settings_url
    assert_response :success
  end

  test "should get tables" do
    get admins_tables_url
    assert_response :success
  end

end
