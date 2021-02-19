require "application_system_test_case"

class CardsTestsTest < ApplicationSystemTestCase
  setup do
    @cards_test = cards_tests(:one)
  end

  test "visiting the index" do
    visit cards_tests_url
    assert_selector "h1", text: "Cards Tests"
  end

  test "creating a Cards test" do
    visit cards_tests_url
    click_on "New Cards Test"

    fill_in "Card", with: @cards_test.card_id
    check "Correct" if @cards_test.correct
    fill_in "Test", with: @cards_test.test_id
    click_on "Create Cards test"

    assert_text "Cards test was successfully created"
    click_on "Back"
  end

  test "updating a Cards test" do
    visit cards_tests_url
    click_on "Edit", match: :first

    fill_in "Card", with: @cards_test.card_id
    check "Correct" if @cards_test.correct
    fill_in "Test", with: @cards_test.test_id
    click_on "Update Cards test"

    assert_text "Cards test was successfully updated"
    click_on "Back"
  end

  test "destroying a Cards test" do
    visit cards_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cards test was successfully destroyed"
  end
end
