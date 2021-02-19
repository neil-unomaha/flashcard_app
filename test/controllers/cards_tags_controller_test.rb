require "test_helper"

class CardsTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cards_tag = cards_tags(:one)
  end

  test "should get index" do
    get cards_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_cards_tag_url
    assert_response :success
  end

  test "should create cards_tag" do
    assert_difference('CardsTag.count') do
      post cards_tags_url, params: { cards_tag: { card_id: @cards_tag.card_id, tag_id: @cards_tag.tag_id } }
    end

    assert_redirected_to cards_tag_url(CardsTag.last)
  end

  test "should show cards_tag" do
    get cards_tag_url(@cards_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_cards_tag_url(@cards_tag)
    assert_response :success
  end

  test "should update cards_tag" do
    patch cards_tag_url(@cards_tag), params: { cards_tag: { card_id: @cards_tag.card_id, tag_id: @cards_tag.tag_id } }
    assert_redirected_to cards_tag_url(@cards_tag)
  end

  test "should destroy cards_tag" do
    assert_difference('CardsTag.count', -1) do
      delete cards_tag_url(@cards_tag)
    end

    assert_redirected_to cards_tags_url
  end
end
