require "application_system_test_case"

class FillinCardsTest < ApplicationSystemTestCase
  setup do
    @fillin_card = fillin_cards(:one)
  end

  test "visiting the index" do
    visit fillin_cards_url
    assert_selector "h1", text: "Fillin Cards"
  end

  test "creating a Fillin card" do
    visit fillin_cards_url
    click_on "New Fillin Card"

    click_on "Create Fillin card"

    assert_text "Fillin card was successfully created"
    click_on "Back"
  end

  test "updating a Fillin card" do
    visit fillin_cards_url
    click_on "Edit", match: :first

    click_on "Update Fillin card"

    assert_text "Fillin card was successfully updated"
    click_on "Back"
  end

  test "destroying a Fillin card" do
    visit fillin_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fillin card was successfully destroyed"
  end
end
