require "application_system_test_case"

class CardsTagsTest < ApplicationSystemTestCase
  setup do
    @cards_tag = cards_tags(:one)
  end

  test "visiting the index" do
    visit cards_tags_url
    assert_selector "h1", text: "Cards Tags"
  end

  test "creating a Cards tag" do
    visit cards_tags_url
    click_on "New Cards Tag"

    fill_in "Card", with: @cards_tag.card_id
    fill_in "Tag", with: @cards_tag.tag_id
    click_on "Create Cards tag"

    assert_text "Cards tag was successfully created"
    click_on "Back"
  end

  test "updating a Cards tag" do
    visit cards_tags_url
    click_on "Edit", match: :first

    fill_in "Card", with: @cards_tag.card_id
    fill_in "Tag", with: @cards_tag.tag_id
    click_on "Update Cards tag"

    assert_text "Cards tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Cards tag" do
    visit cards_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cards tag was successfully destroyed"
  end
end
