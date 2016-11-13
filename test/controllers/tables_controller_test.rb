require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get tables_welcome_url
    assert_response :success
  end

  test "should get home" do
    get tables_home_url
    assert_response :success
  end

end
