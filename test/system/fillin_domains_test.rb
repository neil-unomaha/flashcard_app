require "application_system_test_case"

class FillinDomainsTest < ApplicationSystemTestCase
  setup do
    @fillin_domain = fillin_domains(:one)
  end

  test "visiting the index" do
    visit fillin_domains_url
    assert_selector "h1", text: "Fillin Domains"
  end

  test "creating a Fillin domain" do
    visit fillin_domains_url
    click_on "New Fillin Domain"

    fill_in "Name", with: @fillin_domain.name
    click_on "Create Fillin domain"

    assert_text "Fillin domain was successfully created"
    click_on "Back"
  end

  test "updating a Fillin domain" do
    visit fillin_domains_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fillin_domain.name
    click_on "Update Fillin domain"

    assert_text "Fillin domain was successfully updated"
    click_on "Back"
  end

  test "destroying a Fillin domain" do
    visit fillin_domains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fillin domain was successfully destroyed"
  end
end
