require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get realcraft_190" do
    get pages_realcraft_190_url
    assert_response :success
  end

  test "should get realcraft_200" do
    get pages_realcraft_200_url
    assert_response :success
  end

end
