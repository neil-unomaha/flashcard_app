require "test_helper"

class FillinCardTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fillin_card_test = fillin_card_tests(:one)
  end

  test "should get index" do
    get fillin_card_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_fillin_card_test_url
    assert_response :success
  end

  test "should create fillin_card_test" do
    assert_difference('FillinCardTest.count') do
      post fillin_card_tests_url, params: { fillin_card_test: { correct: @fillin_card_test.correct, fillin_card_id: @fillin_card_test.fillin_card_id, position_hide: @fillin_card_test.position_hide, test_id: @fillin_card_test.test_id } }
    end

    assert_redirected_to fillin_card_test_url(FillinCardTest.last)
  end

  test "should show fillin_card_test" do
    get fillin_card_test_url(@fillin_card_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_fillin_card_test_url(@fillin_card_test)
    assert_response :success
  end

  test "should update fillin_card_test" do
    patch fillin_card_test_url(@fillin_card_test), params: { fillin_card_test: { correct: @fillin_card_test.correct, fillin_card_id: @fillin_card_test.fillin_card_id, position_hide: @fillin_card_test.position_hide, test_id: @fillin_card_test.test_id } }
    assert_redirected_to fillin_card_test_url(@fillin_card_test)
  end

  test "should destroy fillin_card_test" do
    assert_difference('FillinCardTest.count', -1) do
      delete fillin_card_test_url(@fillin_card_test)
    end

    assert_redirected_to fillin_card_tests_url
  end
end
