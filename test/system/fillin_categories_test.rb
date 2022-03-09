require "application_system_test_case"

class FillinCategoriesTest < ApplicationSystemTestCase
  setup do
    @fillin_category = fillin_categories(:one)
  end

  test "visiting the index" do
    visit fillin_categories_url
    assert_selector "h1", text: "Fillin Categories"
  end

  test "creating a Fillin category" do
    visit fillin_categories_url
    click_on "New Fillin Category"

    fill_in "Name", with: @fillin_category.name
    click_on "Create Fillin category"

    assert_text "Fillin category was successfully created"
    click_on "Back"
  end

  test "updating a Fillin category" do
    visit fillin_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fillin_category.name
    click_on "Update Fillin category"

    assert_text "Fillin category was successfully updated"
    click_on "Back"
  end

  test "destroying a Fillin category" do
    visit fillin_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fillin category was successfully destroyed"
  end
end
