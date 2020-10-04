require "application_system_test_case"

class BinRecyclesTest < ApplicationSystemTestCase
  setup do
    @bin_recycle = bin_recycles(:one)
  end

  test "visiting the index" do
    visit bin_recycles_url
    assert_selector "h1", text: "Bin Recycles"
  end

  test "creating a Bin recycle" do
    visit bin_recycles_url
    click_on "New Bin Recycle"

    click_on "Create Bin recycle"

    assert_text "Bin recycle was successfully created"
    click_on "Back"
  end

  test "updating a Bin recycle" do
    visit bin_recycles_url
    click_on "Edit", match: :first

    click_on "Update Bin recycle"

    assert_text "Bin recycle was successfully updated"
    click_on "Back"
  end

  test "destroying a Bin recycle" do
    visit bin_recycles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bin recycle was successfully destroyed"
  end
end
