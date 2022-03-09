require "test_helper"

class FillinCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fillin_card = fillin_cards(:one)
  end

  test "should get index" do
    get fillin_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_fillin_card_url
    assert_response :success
  end

  test "should create fillin_card" do
    assert_difference('FillinCard.count') do
      post fillin_cards_url, params: { fillin_card: {  } }
    end

    assert_redirected_to fillin_card_url(FillinCard.last)
  end

  test "should show fillin_card" do
    get fillin_card_url(@fillin_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_fillin_card_url(@fillin_card)
    assert_response :success
  end

  test "should update fillin_card" do
    patch fillin_card_url(@fillin_card), params: { fillin_card: {  } }
    assert_redirected_to fillin_card_url(@fillin_card)
  end

  test "should destroy fillin_card" do
    assert_difference('FillinCard.count', -1) do
      delete fillin_card_url(@fillin_card)
    end

    assert_redirected_to fillin_cards_url
  end
end
