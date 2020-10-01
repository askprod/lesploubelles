require "application_system_test_case"

class StreetsTest < ApplicationSystemTestCase
  setup do
    @street = streets(:one)
  end

  test "visiting the index" do
    visit streets_url
    assert_selector "h1", text: "Streets"
  end

  test "creating a Street" do
    visit streets_url
    click_on "New Street"

    click_on "Create Street"

    assert_text "Street was successfully created"
    click_on "Back"
  end

  test "updating a Street" do
    visit streets_url
    click_on "Edit", match: :first

    click_on "Update Street"

    assert_text "Street was successfully updated"
    click_on "Back"
  end

  test "destroying a Street" do
    visit streets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Street was successfully destroyed"
  end
end
