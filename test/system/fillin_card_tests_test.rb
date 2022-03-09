require "application_system_test_case"

class FillinCardTestsTest < ApplicationSystemTestCase
  setup do
    @fillin_card_test = fillin_card_tests(:one)
  end

  test "visiting the index" do
    visit fillin_card_tests_url
    assert_selector "h1", text: "Fillin Card Tests"
  end

  test "creating a Fillin card test" do
    visit fillin_card_tests_url
    click_on "New Fillin Card Test"

    check "Correct" if @fillin_card_test.correct
    fill_in "Fillin card", with: @fillin_card_test.fillin_card_id
    check "Position hide" if @fillin_card_test.position_hide
    fill_in "Test", with: @fillin_card_test.test_id
    click_on "Create Fillin card test"

    assert_text "Fillin card test was successfully created"
    click_on "Back"
  end

  test "updating a Fillin card test" do
    visit fillin_card_tests_url
    click_on "Edit", match: :first

    check "Correct" if @fillin_card_test.correct
    fill_in "Fillin card", with: @fillin_card_test.fillin_card_id
    check "Position hide" if @fillin_card_test.position_hide
    fill_in "Test", with: @fillin_card_test.test_id
    click_on "Update Fillin card test"

    assert_text "Fillin card test was successfully updated"
    click_on "Back"
  end

  test "destroying a Fillin card test" do
    visit fillin_card_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fillin card test was successfully destroyed"
  end
end
