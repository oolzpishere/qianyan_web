require "application_system_test_case"

module Admin
  class Manager::AttendDataTest < ApplicationSystemTestCase
    setup do
      @manager_attend_datum = admin_manager_attend_data(:one)
    end

    test "visiting the index" do
      visit manager_attend_data_url
      assert_selector "h1", text: "Attend data"
    end

    test "should create attend datum" do
      visit manager_attend_data_url
      click_on "New attend datum"

      click_on "Create Attend datum"

      assert_text "Attend datum was successfully created"
      click_on "Back"
    end

    test "should update Attend datum" do
      visit manager_attend_datum_url(@manager_attend_datum)
      click_on "Edit this attend datum", match: :first

      click_on "Update Attend datum"

      assert_text "Attend datum was successfully updated"
      click_on "Back"
    end

    test "should destroy Attend datum" do
      visit manager_attend_datum_url(@manager_attend_datum)
      click_on "Destroy this attend datum", match: :first

      assert_text "Attend datum was successfully destroyed"
    end
  end
end
