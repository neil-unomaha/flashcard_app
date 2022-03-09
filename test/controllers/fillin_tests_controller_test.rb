require "test_helper"

class FillinTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fillin_test = fillin_tests(:one)
  end

  test "should get index" do
    get fillin_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_fillin_test_url
    assert_response :success
  end

  test "should create fillin_test" do
    assert_difference('FillinTest.count') do
      post fillin_tests_url, params: { fillin_test: { name: @fillin_test.name } }
    end

    assert_redirected_to fillin_test_url(FillinTest.last)
  end

  test "should show fillin_test" do
    get fillin_test_url(@fillin_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_fillin_test_url(@fillin_test)
    assert_response :success
  end

  test "should update fillin_test" do
    patch fillin_test_url(@fillin_test), params: { fillin_test: { name: @fillin_test.name } }
    assert_redirected_to fillin_test_url(@fillin_test)
  end

  test "should destroy fillin_test" do
    assert_difference('FillinTest.count', -1) do
      delete fillin_test_url(@fillin_test)
    end

    assert_redirected_to fillin_tests_url
  end
end
