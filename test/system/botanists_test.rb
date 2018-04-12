require "application_system_test_case"

class BotanistsTest < ApplicationSystemTestCase
  setup do
    @botanist = botanists(:one)
  end

  test "visiting the index" do
    visit botanists_url
    assert_selector "h1", text: "Botanists"
  end

  test "creating a Botanist" do
    visit botanists_url
    click_on "New Botanist"

    fill_in "First Name", with: @botanist.first_name
    fill_in "Last Name", with: @botanist.last_name
    fill_in "Patronymic", with: @botanist.patronymic
    fill_in "Position", with: @botanist.position
    click_on "Create Botanist"

    assert_text "Botanist was successfully created"
    click_on "Back"
  end

  test "updating a Botanist" do
    visit botanists_url
    click_on "Edit", match: :first

    fill_in "First Name", with: @botanist.first_name
    fill_in "Last Name", with: @botanist.last_name
    fill_in "Patronymic", with: @botanist.patronymic
    fill_in "Position", with: @botanist.position
    click_on "Update Botanist"

    assert_text "Botanist was successfully updated"
    click_on "Back"
  end

  test "destroying a Botanist" do
    visit botanists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Botanist was successfully destroyed"
  end
end
