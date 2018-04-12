require "application_system_test_case"

class ExemplarsTest < ApplicationSystemTestCase
  setup do
    @exemplar = exemplars(:one)
  end

  test "visiting the index" do
    visit exemplars_url
    assert_selector "h1", text: "Exemplars"
  end

  test "creating a Exemplar" do
    visit exemplars_url
    click_on "New Exemplar"

    fill_in "Box", with: @exemplar.box_id
    fill_in "Cupboard", with: @exemplar.cupboard_id
    fill_in "Finded At", with: @exemplar.finded_at
    fill_in "Fund", with: @exemplar.fund
    fill_in "Habitat", with: @exemplar.habitat
    fill_in "Location", with: @exemplar.location
    click_on "Create Exemplar"

    assert_text "Exemplar was successfully created"
    click_on "Back"
  end

  test "updating a Exemplar" do
    visit exemplars_url
    click_on "Edit", match: :first

    fill_in "Box", with: @exemplar.box_id
    fill_in "Cupboard", with: @exemplar.cupboard_id
    fill_in "Finded At", with: @exemplar.finded_at
    fill_in "Fund", with: @exemplar.fund
    fill_in "Habitat", with: @exemplar.habitat
    fill_in "Location", with: @exemplar.location
    click_on "Update Exemplar"

    assert_text "Exemplar was successfully updated"
    click_on "Back"
  end

  test "destroying a Exemplar" do
    visit exemplars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exemplar was successfully destroyed"
  end
end
