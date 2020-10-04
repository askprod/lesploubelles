require "application_system_test_case"

class BinGreensTest < ApplicationSystemTestCase
  setup do
    @bin_green = bin_greens(:one)
  end

  test "visiting the index" do
    visit bin_greens_url
    assert_selector "h1", text: "Bin Greens"
  end

  test "creating a Bin green" do
    visit bin_greens_url
    click_on "New Bin Green"

    click_on "Create Bin green"

    assert_text "Bin green was successfully created"
    click_on "Back"
  end

  test "updating a Bin green" do
    visit bin_greens_url
    click_on "Edit", match: :first

    click_on "Update Bin green"

    assert_text "Bin green was successfully updated"
    click_on "Back"
  end

  test "destroying a Bin green" do
    visit bin_greens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bin green was successfully destroyed"
  end
end
