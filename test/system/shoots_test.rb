require "application_system_test_case"

class ShootsTest < ApplicationSystemTestCase
  setup do
    @shoot = shoots(:one)
  end

  test "visiting the index" do
    visit shoots_url
    assert_selector "h1", text: "Shoots"
  end

  test "creating a Shoot" do
    visit shoots_url
    click_on "New Shoot"

    fill_in "Assignment description", with: @shoot.assignment_description
    fill_in "Contact name", with: @shoot.contact_name
    fill_in "Contact phone", with: @shoot.contact_phone
    fill_in "Deadline", with: @shoot.deadline
    fill_in "End", with: @shoot.end
    fill_in "Location", with: @shoot.location
    fill_in "Slug", with: @shoot.slug
    fill_in "Start", with: @shoot.start
    click_on "Create Shoot"

    assert_text "Shoot was successfully created"
    click_on "Back"
  end

  test "updating a Shoot" do
    visit shoots_url
    click_on "Edit", match: :first

    fill_in "Assignment description", with: @shoot.assignment_description
    fill_in "Contact name", with: @shoot.contact_name
    fill_in "Contact phone", with: @shoot.contact_phone
    fill_in "Deadline", with: @shoot.deadline
    fill_in "End", with: @shoot.end
    fill_in "Location", with: @shoot.location
    fill_in "Slug", with: @shoot.slug
    fill_in "Start", with: @shoot.start
    click_on "Update Shoot"

    assert_text "Shoot was successfully updated"
    click_on "Back"
  end

  test "destroying a Shoot" do
    visit shoots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shoot was successfully destroyed"
  end
end
