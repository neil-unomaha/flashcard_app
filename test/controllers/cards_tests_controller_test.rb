require "test_helper"

class CardsTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cards_test = cards_tests(:one)
  end

  test "should get index" do
    get cards_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_cards_test_url
    assert_response :success
  end

  test "should create cards_test" do
    assert_difference('CardsTest.count') do
      post cards_tests_url, params: { cards_test: { card_id: @cards_test.card_id, correct: @cards_test.correct, test_id: @cards_test.test_id } }
    end

    assert_redirected_to cards_test_url(CardsTest.last)
  end

  test "should show cards_test" do
    get cards_test_url(@cards_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_cards_test_url(@cards_test)
    assert_response :success
  end

  test "should update cards_test" do
    patch cards_test_url(@cards_test), params: { cards_test: { card_id: @cards_test.card_id, correct: @cards_test.correct, test_id: @cards_test.test_id } }
    assert_redirected_to cards_test_url(@cards_test)
  end

  test "should destroy cards_test" do
    assert_difference('CardsTest.count', -1) do
      delete cards_test_url(@cards_test)
    end

    assert_redirected_to cards_tests_url
  end
end
