require "test_helper"

module Admin
  class Manager::ArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @manager_article = admin_manager_articles(:one)
    end

    test "should get index" do
      get manager_articles_url
      assert_response :success
    end

    test "should get new" do
      get new_manager_article_url
      assert_response :success
    end

    test "should create manager_article" do
      assert_difference("Manager::Article.count") do
        post manager_articles_url, params: { manager_article: {  } }
      end

      assert_redirected_to manager_article_url(Manager::Article.last)
    end

    test "should show manager_article" do
      get manager_article_url(@manager_article)
      assert_response :success
    end

    test "should get edit" do
      get edit_manager_article_url(@manager_article)
      assert_response :success
    end

    test "should update manager_article" do
      patch manager_article_url(@manager_article), params: { manager_article: {  } }
      assert_redirected_to manager_article_url(@manager_article)
    end

    test "should destroy manager_article" do
      assert_difference("Manager::Article.count", -1) do
        delete manager_article_url(@manager_article)
      end

      assert_redirected_to manager_articles_url
    end
  end
end
