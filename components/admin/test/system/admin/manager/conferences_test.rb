require "application_system_test_case"

module Admin
  class Manager::ConferencesTest < ApplicationSystemTestCase
    setup do
      @manager_conference = admin_manager_conferences(:one)
    end

    test "visiting the index" do
      visit manager_conferences_url
      assert_selector "h1", text: "Conferences"
    end

    test "should create conference" do
      visit manager_conferences_url
      click_on "New conference"

      click_on "Create Conference"

      assert_text "Conference was successfully created"
      click_on "Back"
    end

    test "should update Conference" do
      visit manager_conference_url(@manager_conference)
      click_on "Edit this conference", match: :first

      click_on "Update Conference"

      assert_text "Conference was successfully updated"
      click_on "Back"
    end

    test "should destroy Conference" do
      visit manager_conference_url(@manager_conference)
      click_on "Destroy this conference", match: :first

      assert_text "Conference was successfully destroyed"
    end
  end
end
