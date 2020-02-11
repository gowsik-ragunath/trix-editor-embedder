require "application_system_test_case"

class EmbedsTest < ApplicationSystemTestCase
  setup do
    @embed = embeds(:one)
  end

  test "visiting the index" do
    visit embeds_url
    assert_selector "h1", text: "Embeds"
  end

  test "creating a Embed" do
    visit embeds_url
    click_on "New Embed"

    fill_in "Url", with: @embed.url
    click_on "Create Embed"

    assert_text "Embed was successfully created"
    click_on "Back"
  end

  test "updating a Embed" do
    visit embeds_url
    click_on "Edit", match: :first

    fill_in "Url", with: @embed.url
    click_on "Update Embed"

    assert_text "Embed was successfully updated"
    click_on "Back"
  end

  test "destroying a Embed" do
    visit embeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Embed was successfully destroyed"
  end
end
