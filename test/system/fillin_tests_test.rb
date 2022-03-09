require "application_system_test_case"

class FillinTestsTest < ApplicationSystemTestCase
  setup do
    @fillin_test = fillin_tests(:one)
  end

  test "visiting the index" do
    visit fillin_tests_url
    assert_selector "h1", text: "Fillin Tests"
  end

  test "creating a Fillin test" do
    visit fillin_tests_url
    click_on "New Fillin Test"

    fill_in "Name", with: @fillin_test.name
    click_on "Create Fillin test"

    assert_text "Fillin test was successfully created"
    click_on "Back"
  end

  test "updating a Fillin test" do
    visit fillin_tests_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fillin_test.name
    click_on "Update Fillin test"

    assert_text "Fillin test was successfully updated"
    click_on "Back"
  end

  test "destroying a Fillin test" do
    visit fillin_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fillin test was successfully destroyed"
  end
end
