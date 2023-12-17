require "application_system_test_case"

class VinylsTest < ApplicationSystemTestCase
  setup do
    @vinyl = vinyls(:one)
  end

  test "visiting the index" do
    visit vinyls_url
    assert_selector "h1", text: "Vinyls"
  end

  test "should create vinyl" do
    visit vinyls_url
    click_on "New vinyl"

    fill_in "Album name", with: @vinyl.album_name
    fill_in "Artist name", with: @vinyl.artist_name
    click_on "Create Vinyl"

    assert_text "Vinyl was successfully created"
    click_on "Back"
  end

  test "should update Vinyl" do
    visit vinyl_url(@vinyl)
    click_on "Edit this vinyl", match: :first

    fill_in "Album name", with: @vinyl.album_name
    fill_in "Artist name", with: @vinyl.artist_name
    click_on "Update Vinyl"

    assert_text "Vinyl was successfully updated"
    click_on "Back"
  end

  test "should destroy Vinyl" do
    visit vinyl_url(@vinyl)
    click_on "Destroy this vinyl", match: :first

    assert_text "Vinyl was successfully destroyed"
  end
end
