require "application_system_test_case"

module Admin
  class Manager::JsjFormsTest < ApplicationSystemTestCase
    setup do
      @manager_jsj_form = admin_manager_jsj_forms(:one)
    end

    test "visiting the index" do
      visit manager_jsj_forms_url
      assert_selector "h1", text: "Jsj forms"
    end

    test "should create jsj form" do
      visit manager_jsj_forms_url
      click_on "New jsj form"

      click_on "Create Jsj form"

      assert_text "Jsj form was successfully created"
      click_on "Back"
    end

    test "should update Jsj form" do
      visit manager_jsj_form_url(@manager_jsj_form)
      click_on "Edit this jsj form", match: :first

      click_on "Update Jsj form"

      assert_text "Jsj form was successfully updated"
      click_on "Back"
    end

    test "should destroy Jsj form" do
      visit manager_jsj_form_url(@manager_jsj_form)
      click_on "Destroy this jsj form", match: :first

      assert_text "Jsj form was successfully destroyed"
    end
  end
end
