require "application_system_test_case"

module Admin
  class Manager::ExternalArticlesTest < ApplicationSystemTestCase
    setup do
      @manager_external_article = admin_manager_external_articles(:one)
    end

    test "visiting the index" do
      visit manager_external_articles_url
      assert_selector "h1", text: "External articles"
    end

    test "should create external article" do
      visit manager_external_articles_url
      click_on "New external article"

      click_on "Create External article"

      assert_text "External article was successfully created"
      click_on "Back"
    end

    test "should update External article" do
      visit manager_external_article_url(@manager_external_article)
      click_on "Edit this external article", match: :first

      click_on "Update External article"

      assert_text "External article was successfully updated"
      click_on "Back"
    end

    test "should destroy External article" do
      visit manager_external_article_url(@manager_external_article)
      click_on "Destroy this external article", match: :first

      assert_text "External article was successfully destroyed"
    end
  end
end
