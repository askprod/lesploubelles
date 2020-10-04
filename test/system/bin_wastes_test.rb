require "application_system_test_case"

class BinWastesTest < ApplicationSystemTestCase
  setup do
    @bin_waste = bin_wastes(:one)
  end

  test "visiting the index" do
    visit bin_wastes_url
    assert_selector "h1", text: "Bin Wastes"
  end

  test "creating a Bin waste" do
    visit bin_wastes_url
    click_on "New Bin Waste"

    click_on "Create Bin waste"

    assert_text "Bin waste was successfully created"
    click_on "Back"
  end

  test "updating a Bin waste" do
    visit bin_wastes_url
    click_on "Edit", match: :first

    click_on "Update Bin waste"

    assert_text "Bin waste was successfully updated"
    click_on "Back"
  end

  test "destroying a Bin waste" do
    visit bin_wastes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bin waste was successfully destroyed"
  end
end
