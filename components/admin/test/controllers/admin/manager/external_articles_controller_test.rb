require "test_helper"

module Admin
  class Manager::ExternalArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @manager_external_article = admin_manager_external_articles(:one)
    end

    test "should get index" do
      get manager_external_articles_url
      assert_response :success
    end

    test "should get new" do
      get new_manager_external_article_url
      assert_response :success
    end

    test "should create manager_external_article" do
      assert_difference("Manager::ExternalArticle.count") do
        post manager_external_articles_url, params: { manager_external_article: {  } }
      end

      assert_redirected_to manager_external_article_url(Manager::ExternalArticle.last)
    end

    test "should show manager_external_article" do
      get manager_external_article_url(@manager_external_article)
      assert_response :success
    end

    test "should get edit" do
      get edit_manager_external_article_url(@manager_external_article)
      assert_response :success
    end

    test "should update manager_external_article" do
      patch manager_external_article_url(@manager_external_article), params: { manager_external_article: {  } }
      assert_redirected_to manager_external_article_url(@manager_external_article)
    end

    test "should destroy manager_external_article" do
      assert_difference("Manager::ExternalArticle.count", -1) do
        delete manager_external_article_url(@manager_external_article)
      end

      assert_redirected_to manager_external_articles_url
    end
  end
end
