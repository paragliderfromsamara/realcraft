require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_path
    assert_response :success, "Не удалось открыть главную страницу"
  end

  test "should get about" do
    get about_path
    assert_response :success, "Не удалось открыть страницу о нас"
  end

  test "should get realcraft_190" do
    get realcraft_190_path
    assert_response :success, "Не удалось открыть страницу realcraft_190"
  end

  test "should get realcraft_200" do
    get realcraft_200_path
    assert_response :success, "Не удалось открыть страницу realcraft_200"
  end

end
